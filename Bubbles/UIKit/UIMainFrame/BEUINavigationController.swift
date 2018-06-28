//
//  BEUINavigationController.swift
//  Bubbles
//
//  Created by god on 2018/6/26.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

open class BEUINavigationController: UINavigationController {
  
  public override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    didInitialize()
  }
  
  public override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
    super.init(navigationBarClass: navigationBarClass, toolbarClass: toolbarClass)
    didInitialize()
  }
  
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
  /// @see init(rootViewController: UIViewController)
  /// @see init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?)
  /// @see init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  /// @see init?(coder aDecoder: NSCoder)
  open func didInitialize() {
    style = BEUIConfiguration.style.navigationBarStyle
  }
  
  /// The style guide the BEUINavigationController should use.
  public var style: BEUINavigationBarStyle? {
    didSet {
      guard let style = style else { return }
      navigationBar.setBackgroundImage(style.navBarBackgroundImageOrNil, for: .default)
      navigationBar.shadowImage = style.navBarShadowImageOrNil
      navigationBar.barTintColor = style.navBarBarTintColorOrNil
      navigationBar.tintColor = style.navBarTintColorOrNil
    }
  }
  
  /// MARK: - CustomNavigationBarTransition
  
  open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    guard let disappearing: BEUIViewController = viewControllers.last as? BEUIViewController else {
      super.pushViewController(viewController, animated: animated)
      return
    }
    guard let wilappearing: BEUIViewController = viewController as? BEUIViewController else {
      super.pushViewController(viewController, animated: animated)
      return
    }
    
    var shouldCustomNavigationBarTransition: Bool = false
    if disappearing.transition.shouldCustomNavigationBarTransitionWhenPushDisappearing == true {
      shouldCustomNavigationBarTransition = true
    } else if wilappearing.transition.shouldCustomNavigationBarTransitionWhenPushDisappearing == true {
      shouldCustomNavigationBarTransition = true
    }
    if shouldCustomNavigationBarTransition == true {
      disappearing.addTransitionNavigationBarIfNeeded()
      disappearing.prefersNavigationBarBackgroundViewHidden = true
    }
    
    super.pushViewController(viewController, animated: animated)
  }
  
  open override func popViewController(animated: Bool) -> UIViewController? {
    let disappearingvc = viewControllers.last
    let wilappearingvc = viewControllers.count >= 2 ? viewControllers[viewControllers.count - 2] : nil
    handleCustomNavigationBarTransitionWhenPop(disappearOrNil: disappearingvc, appearOrNil: wilappearingvc)
    return super.popViewController(animated: animated)
  }
  
  open override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
    let disappearingvc = viewControllers.last
    let wilappearingvc = viewController
    let poppedViewControllers = super.popToViewController(viewController, animated: animated)
    if poppedViewControllers != nil {
      handleCustomNavigationBarTransitionWhenPop(disappearOrNil: disappearingvc, appearOrNil: wilappearingvc)
    }
    return poppedViewControllers
  }
  
  open override func popToRootViewController(animated: Bool) -> [UIViewController]? {
    let poppedViewControllers = super.popToRootViewController(animated: animated)
    if viewControllers.count > 1 {
      let disappearingvc = viewControllers.last
      let wilappearingvc = viewControllers.first
      if poppedViewControllers != nil {
        handleCustomNavigationBarTransitionWhenPop(disappearOrNil: disappearingvc, appearOrNil: wilappearingvc)
      }
    }
    return poppedViewControllers
  }
  
  func handleCustomNavigationBarTransitionWhenPop(disappearOrNil: UIViewController?,
                                                  appearOrNil: UIViewController?) {
    guard let disappearing: BEUIViewController = disappearOrNil as? BEUIViewController else { return }
    guard let wilappearing: BEUIViewController = appearOrNil as? BEUIViewController else { return }
    
    var shouldCustomNavigationBarTransition: Bool = false
    if disappearing.transition.shouldCustomNavigationBarTransitionWhenPushDisappearing == true {
      shouldCustomNavigationBarTransition = true
    } else if wilappearing.transition.shouldCustomNavigationBarTransitionWhenPushDisappearing == true {
      shouldCustomNavigationBarTransition = true
    }
    if shouldCustomNavigationBarTransition == true {
      disappearing.addTransitionNavigationBarIfNeeded()
      if wilappearing.transitionNavigationBar != nil {
        BEUIViewController.replaceNavigationBarStyle(one: wilappearing.transitionNavigationBar!,
                                                     other: navigationBar)
      }
      disappearing.prefersNavigationBarBackgroundViewHidden = true
    }
  }
}
