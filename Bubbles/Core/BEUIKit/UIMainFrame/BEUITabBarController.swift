
import UIKit

open class BEUITabBarController: UITabBarController {
  
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
    uiStyle = BEUIConfiguration.style.tabBarStyle
  }
  
  /// The style guide the BEUITabBarController should use.
  public var uiStyle: BEUITabBarStyle? {
    didSet {
      guard let uiStyle = uiStyle else { return }
      tabBar.backgroundImage = uiStyle.tabBarBackgroundImageOrNil
      tabBar.isTranslucent = uiStyle.tabBarTranslucent
      tabBar.barTintColor = uiStyle.tabBarBarTintColorOrNil
      tabBar.shadowImage = uiStyle.tabBarShadowImageOrNil
      tabBar.tintColor = uiStyle.tabBarTintColorOrNil
      tabBar.barStyle = uiStyle.tabBarStyle
    }
  }
  
  /// MARK: - Autorotate
  
  open override var shouldAutorotate: Bool {
    return true
  }
  
  open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if let controller = selectedViewController {
      return controller.supportedInterfaceOrientations
    }
    let orientation = BEUIConfiguration.style.otherStyle.supportedOrientationMask
    return orientation
  }
}
