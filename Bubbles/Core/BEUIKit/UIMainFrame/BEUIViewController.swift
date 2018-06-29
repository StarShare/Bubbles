
import UIKit

struct BEUINavigationBarDefaultAppearance: BEUINavigationBarAppearance {
  public var shouldSetStatusBarStyleLight: Bool = BEUIConfiguration.style.otherStyle.statusbarStyleLightInitially
  public var navigationBarBackgroundImageOrNil: UIImage? = BEUIConfiguration.style.navigationBarStyle.navBarBackgroundImageOrNil
  public var navigationBarShadowImageOrNil: UIImage? = BEUIConfiguration.style.navigationBarStyle.navBarShadowImageOrNil
  public var navigationBarTintColorOrNil: UIColor? = BEUIConfiguration.style.navigationBarStyle.navBarTintColorOrNil
  public var titleViewTintColorOrNil: UIColor? = nil
  public var titleViewFontOrNil: UIFont? = BEUIConfiguration.style.navigationBarStyle.navBarTitleFontOrNil
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
    titleView = BEUINavigationTitleView()
    style = BEUIConfiguration.style.viewControllerStyle
    transition = BEUINavigationBarDefaultTransition()
    appearance = BEUINavigationBarDefaultAppearance()
    supportedOrientationMask = BEUIConfiguration.style.otherStyle.supportedOrientationMask
    hidesBottomBarWhenPushed = BEUIConfiguration.style.otherStyle.hidesBottomBarWhenPushedInitially
    extendedLayoutIncludesOpaqueBars = true
  }
  
  /// viewController Keeping Appear When SetViewControllers
  open func viewControllerKeepingAppearWhenSetViewControllers(_ animated: Bool) {
    navigationItem.titleView = titleView
  }
  
  /// The style guide the BEUIViewController should use.
  public var style: BEUIViewControllerStyle? {
    didSet {
      if (false == isViewLoaded) { return }
      guard let style = style else { return }
      view.backgroundColor = style.backgroundColorOrNil
    }
  }
  
  /// The titleView of UINavigationBar.
  public var titleView: BEUINavigationTitleView!
  
  /// The supported OrientationMask.
  public var supportedOrientationMask: UIInterfaceOrientationMask!
  
  /// The transition guide the UIViewController should use.
  public var transition: BEUINavigationBarTransition!
  
  /// The Appearance guide the UINavigationController.NavigationBar should use.
  public var appearance: BEUINavigationBarAppearance!
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    if let style = style {
      view.backgroundColor = style.backgroundColorOrNil
    }
  }
  
  /// MARK: - CustomNavigationBarTransition
  
  /// The navBar of CustomTransition.
  internal var transitionNavigationBar: UINavigationBar?
  
  /// The flag of lock TransitionNavigationBar.
  internal var lockTransitionNavigationBar: Bool = false
  
  /// The flag of lock originContainerView BackgroundColor.
  internal var originContainerViewBackgroundColor: UIColor?
  
  /// The flag of lock originView ClipsToBounds.
  internal var originClipsToBounds: Bool = false
  
  /// The flag of NavigationBarBackgroundViewHidden.
  internal var prefersNavigationBarBackgroundViewHidden: Bool = false {
    didSet {
      hidenNavigationBarBackgroundView(prefersNavigationBarBackgroundViewHidden)
    }
  }
  
  open override func viewWillAppear(_ animated: Bool) {
    navigationItem.titleView = titleView
    renderNavigationStyle(self, animated: animated)
    super.viewWillAppear(animated)
  }
  
  open override func viewDidAppear(_ animated: Bool) {
    if transitionNavigationBar != nil {
      if let navigationBar = navigationController?.navigationBar {
        BEUIViewController.replaceNavigationBarStyle(source: transitionNavigationBar!,
                                                     target: navigationBar)
      }
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
      if transitionNavigationBar == nil {
        if isPushingViewContrller == true {
          let pushAppearing = to?.transition.shouldCustomNavigationBarTransitionWhenPushAppearing ?? false
          let pushDisappearing = from?.transition.shouldCustomNavigationBarTransitionWhenPushDisappearing ?? false
          shouldCustomNavigationBarTransition = pushAppearing || pushDisappearing
        } else {
          let popAppearing = to?.transition.shouldCustomNavigationBarTransitionWhenPopAppearing ?? false
          let popDisappearing = from?.transition.shouldCustomNavigationBarTransitionWhenPopDisappearing ?? false
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
  
  /// MARK: - StatusBarStyle
  
  open override var preferredStatusBarStyle: UIStatusBarStyle {
    return appearance.shouldSetStatusBarStyleLight ? .lightContent : .`default`
  }
}