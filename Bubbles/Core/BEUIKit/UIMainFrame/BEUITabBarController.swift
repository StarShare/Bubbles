
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
    style = BEUIConfiguration.style.tabBarStyle
  }
  
  /// The style guide the BEUITabBarController should use.
  public var style: BEUITabBarStyle? {
    didSet {
      guard let style = style else { return }
      tabBar.backgroundImage = style.tabBarBackgroundImageOrNil
      tabBar.isTranslucent = style.tabBarTranslucent
      tabBar.barTintColor = style.tabBarBarTintColorOrNil
      tabBar.shadowImage = style.tabBarShadowImageOrNil
      tabBar.tintColor = style.tabBarTintColorOrNil
      tabBar.barStyle = style.tabBarStyle
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
