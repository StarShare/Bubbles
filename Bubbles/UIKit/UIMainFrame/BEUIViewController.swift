//
//  BEUIViewController.swift
//  Bubbles
//
//  Created by god on 2018/6/27.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

struct BEUINavigationBarDefaultAppearance: BEUINavigationBarAppearance {
  public var shouldSetStatusBarStyleLight: Bool = BEUIConfiguration.style.otherStyle.statusbarStyleLightInitially
  public var navigationBarBackgroundImageOrNil: UIImage? = BEUIConfiguration.style.navigationBarStyle.navBarBackgroundImageOrNil
  public var navigationBarShadowImageOrNil: UIImage? = BEUIConfiguration.style.navigationBarStyle.navBarShadowImageOrNil
  public var navigationBarTintColorOrNil: UIColor? = BEUIConfiguration.style.navigationBarStyle.navBarTintColorOrNil
  public var titleViewTintColorOrNil: UIColor? = nil
  public var backBarButtonItemTitleOrNil: String? = nil
}

struct BEUINavigationBarDefaultTransition: BEUINavigationBarTransition {
  public var preferredNavigationBarHidden: Bool = BEUIConfiguration.style.otherStyle.navigationBarHiddenInitially
  public var shouldCustomizeNavigationBarTransitionIfHideable: Bool = false
  public var shouldCustomNavigationBarTransitionWhenPushAppearing: Bool = false
  public var shouldCustomNavigationBarTransitionWhenPushDisappearing: Bool = false
  public var shouldCustomNavigationBarTransitionWhenPopAppearing: Bool = false
  public var shouldCustomNavigationBarTransitionWhenPopDisappearing: Bool = false
  public var containerViewBackgroundColorWhenTransitioningOrNil: UIColor? = nil
}

open class BEUIViewController: UIViewController {
  
  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    didInitialize()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    didInitialize()
  }
  
  /// will call after initialization.
  ///
  /// @see init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  /// @see init?(coder aDecoder: NSCoder)
  open func didInitialize() {
    style = BEUIConfiguration.style.viewControllerStyle
    transition = BEUINavigationBarDefaultTransition()
    appearance = BEUINavigationBarDefaultAppearance()
    supportedOrientationMask = BEUIConfiguration.style.otherStyle.supportedOrientationMask
    extendedLayoutIncludesOpaqueBars = true
    hidesBottomBarWhenPushed = BEUIConfiguration.style.otherStyle.hidesBottomBarWhenPushedInitially
  }
  
  /// The style guide the BEUIViewController should use.
  public var style: BEUIViewControllerStyle? {
    didSet {
      if (false == isViewLoaded) { return }
      guard let style = style else { return }
      view.backgroundColor = style.backgroundColorOrNil
    }
  }
  
  /// The supported OrientationMask.
  var supportedOrientationMask: UIInterfaceOrientationMask!
  
  /// The transition guide the UIViewController should use.
  var transition: BEUINavigationBarTransition!
  
  /// The Appearance guide the UINavigationController.NavigationBar should use.
  var appearance: BEUINavigationBarAppearance!
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    if let style = style {
      view.backgroundColor = style.backgroundColorOrNil
    }
  }
  
  open override func viewWillAppear(_ animated: Bool) {
    renderNavigationStyle(self, animated: animated)
    super.viewWillAppear(animated)
  }
  
  /// MARK: - CustomNavigationBarTransition
  
  /// The navBar of CustomTransition.
  var transitionNavigationBar: UINavigationBar?
  
  /// The flag of lock TransitionNavigationBar.
  var lockTransitionNavigationBar: Bool = false
  
  /// The flag of lock originContainerView BackgroundColor.
  var originContainerViewBackgroundColor: UIColor?
  
  /// The flag of lock originView ClipsToBounds.
  var originClipsToBounds: Bool = false
  
  /// The flag of NavigationBarBackgroundViewHidden.
  var prefersNavigationBarBackgroundViewHidden: Bool = false {
    didSet {
      hidenNavigationBarBackgroundView(prefersNavigationBarBackgroundViewHidden)
    }
  }
  
  open override func viewDidAppear(_ animated: Bool) {
    guard let navigationBar = navigationController?.navigationBar else {
      super.viewDidAppear(animated)
      return
    }
    if transitionNavigationBar != nil {
      BEUIViewController.replaceNavigationBarStyle(one: transitionNavigationBar!, other: navigationBar)
      removeTransitionNavigationBarIfNeeded()
      lockTransitionNavigationBar = true
      let coordinator = transitionCoordinator
      coordinator?.containerView.backgroundColor = originContainerViewBackgroundColor
      view.clipsToBounds = originClipsToBounds
    }
    prefersNavigationBarBackgroundViewHidden = false
    super.viewDidAppear(animated)
  }
  
  open override func viewDidDisappear(_ animated: Bool) {
    if transitionNavigationBar != nil {
      removeTransitionNavigationBarIfNeeded()
      lockTransitionNavigationBar = false
      view.clipsToBounds = originClipsToBounds
    }
    super.viewDidDisappear(animated)
  }
  
  open override func viewDidLayoutSubviews() {
    guard let navigationBar = navigationController?.navigationBar else {
      super.viewDidLayoutSubviews()
      return
    }
    guard let coordinator = transitionCoordinator else {
      super.viewDidLayoutSubviews()
      return
    }
    let from = coordinator.viewController(forKey: UITransitionContextViewControllerKey.from) as? BEUIViewController
    let to   = coordinator.viewController(forKey: UITransitionContextViewControllerKey.to) as? BEUIViewController
    let last = navigationController?.viewControllers.last as? BEUIViewController
    let isPushingViewContrller = from == nil ? false : navigationController?.viewControllers.contains(from!)
    let isCurrentToViewController = self == last && self == to
    
    if isCurrentToViewController == true && lockTransitionNavigationBar == false {
      var shouldCustomNavigationBarTransition = false
      
      if transitionNavigationBar != nil {
        if isPushingViewContrller == true {
          let pushAppearing = transition.shouldCustomNavigationBarTransitionWhenPushAppearing
          let pushDisappearing = transition.shouldCustomNavigationBarTransitionWhenPushDisappearing
          shouldCustomNavigationBarTransition = pushAppearing || pushDisappearing
        } else {
          let popAppearing = transition.shouldCustomNavigationBarTransitionWhenPopAppearing
          let popDisappearing = transition.shouldCustomNavigationBarTransitionWhenPopDisappearing
          shouldCustomNavigationBarTransition = popAppearing || popDisappearing
        }
      }
      
      if shouldCustomNavigationBarTransition {
        if navigationBar.isTranslucent {
          to?.originContainerViewBackgroundColor = coordinator.containerView.backgroundColor
          coordinator.containerView.backgroundColor = transition.containerViewBackgroundColorWhenTransitioningOrNil
        }
        from?.originClipsToBounds = from?.view.clipsToBounds ?? false
        to?.originClipsToBounds = to?.view.clipsToBounds ?? false
        from?.view.clipsToBounds = false
        to?.view.clipsToBounds = false
        addTransitionNavigationBarIfNeeded()
        resizeTransitionNavigationBarFrame()
        prefersNavigationBarBackgroundViewHidden = true
      }
    }
    
    super.viewDidLayoutSubviews()
  }
  
  /// MARK: - Autorotate
  
  open override var shouldAutorotate: Bool {
    return true
  }
  
  open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return supportedOrientationMask
  }
  
  open override var prefersHomeIndicatorAutoHidden: Bool {
    return false
  }
  
  open override var preferredStatusBarStyle: UIStatusBarStyle {
    return appearance.shouldSetStatusBarStyleLight ? .lightContent : .`default`
  }
}
