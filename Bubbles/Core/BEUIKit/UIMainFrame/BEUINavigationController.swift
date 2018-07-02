
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
    uiStyle = BEUIConfiguration.style.navigationBarStyle
  }
  
  /// The style guide the BEUINavigationController should use.
  public var uiStyle: BEUINavigationBarStyle? {
    didSet {
      guard let uiStyle = uiStyle else { return }
      navigationBar.setBackgroundImage(uiStyle.navBarBackgroundImageOrNil, for: .default)
      navigationBar.isTranslucent = uiStyle.navBarTranslucent
      navigationBar.barTintColor = uiStyle.navBarBarTintColorOrNil
      navigationBar.shadowImage = uiStyle.navBarShadowImageOrNil
      navigationBar.tintColor = uiStyle.navBarTintColorOrNil
      navigationBar.barStyle = uiStyle.navBarStyle
    }
  }
  
  /// MARK: - CustomNavigationBarTransition
  
  open override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
    super.setViewControllers(viewControllers, animated: animated)
    if topViewController == viewControllers.last {
      if let controller: BEUIViewController = topViewController as? BEUIViewController {
        controller.viewControllerKeepingAppearWhenSetViewControllers(animated)
      }
    }
  }
  
  open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    if let currentViewController = topViewController {
      if BEUIConfiguration.style.otherStyle.needsBackBarButtonItemTitle == false {
        currentViewController.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "",
                                                                                      style: .plain,
                                                                                      target: nil,
                                                                                      action: nil)
      } else {
        if let controller: BEUIViewController = currentViewController as? BEUIViewController {
          let title = controller.appearance.backBarButtonItemTitleOrNil
          currentViewController.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: title,
                                                                                        style: .plain,
                                                                                        target: nil,
                                                                                        action: nil)
        }
      }
    }
    
    guard let disappearing: BEUIViewController = viewControllers.last as? BEUIViewController else {
      super.pushViewController(viewController, animated: animated)
      return
    }
    guard let willappearing: BEUIViewController = viewController as? BEUIViewController else {
      super.pushViewController(viewController, animated: animated)
      return
    }
    
    var shouldCustomNavigationBarTransition: Bool = false
    if disappearing.transition.shouldCustomNavigationBarTransitionWhenPushDisappearing == true {
      shouldCustomNavigationBarTransition = true
    } else if willappearing.transition.shouldCustomNavigationBarTransitionWhenPushAppearing == true {
      shouldCustomNavigationBarTransition = true
    }
    if shouldCustomNavigationBarTransition == true {
      disappearing.addTransitionNavigationBarIfNeeded()
      disappearing.prefersNavigationBarBackgroundViewHidden = true
    }
    
    super.pushViewController(viewController, animated: animated)
  }
  
  open override func popViewController(animated: Bool) -> UIViewController? {
    let disappearingvc  = viewControllers.last
    let willappearingvc = viewControllers.count >= 2 ? viewControllers[viewControllers.count - 2] : nil
    handleCustomNavigationBarTransitionWhenPop(disappearOrNil: disappearingvc, appearOrNil: willappearingvc)
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
    guard let  disappearing: BEUIViewController = disappearOrNil as? BEUIViewController else { return }
    guard let willappearing: BEUIViewController = appearOrNil as? BEUIViewController else { return }
    
    var shouldCustomNavigationBarTransition: Bool = false
    if disappearing.transition.shouldCustomNavigationBarTransitionWhenPopDisappearing == true {
      shouldCustomNavigationBarTransition = true
    } else if willappearing.transition.shouldCustomNavigationBarTransitionWhenPopAppearing == true {
      shouldCustomNavigationBarTransition = true
    }
    if shouldCustomNavigationBarTransition == true {
      disappearing.addTransitionNavigationBarIfNeeded()
      if willappearing.transitionNavigationBar != nil {
        BEUIViewController.replaceNavigationBarStyle(source: willappearing.transitionNavigationBar!,
                                                     target: navigationBar)
      }
      disappearing.prefersNavigationBarBackgroundViewHidden = true
    }
  }
  
  /// MARK: - Autorotate
  
  open override var shouldAutorotate: Bool {
    return true
  }
  
  open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if let controller = topViewController {
      return controller.supportedInterfaceOrientations
    }
    let orientation = BEUIConfiguration.style.otherStyle.supportedOrientationMask
    return orientation
  }
  
  /// MARK: - StatusBarStyle
  
  open override var preferredStatusBarStyle: UIStatusBarStyle {
    if let controller = topViewController {
      return controller.preferredStatusBarStyle
    }
    let light = BEUIConfiguration.style.otherStyle.statusbarStyleLightInitially
    return light ? .lightContent : .`default`
  }
}
