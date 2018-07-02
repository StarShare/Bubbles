
import UIKit

struct UINavigationBarStyle: BEUINavigationBarStyle {
  public var navBarHighlightedAlpha: CGFloat = 0.2
  public var navBarDisabledAlpha: CGFloat = 0.2
  public var navBarButtonFontOrNil: UIFont? = nil
  public var navBarButtonFontBoldOrNil: UIFont? = nil
  public var navBarBackgroundImageOrNil: UIImage? = UIImage.imageCreate(color: UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1))
  public var navBarShadowImageOrNil: UIImage? = nil
  public var navBarBarTintColorOrNil: UIColor? = nil
  public var navBarTintColorOrNil: UIColor? = nil
  public var navBarStyle: UIBarStyle = .default
  public var navBarTranslucent = false
  public var navBarTitleColorOrNil: UIColor? = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
  public var navBarTitleFontOrNil: UIFont? = UIFont.boldSystemFont(ofSize: 18)
  public var navBarBackIndicatorImageOrNil: UIImage? = nil
}

struct UITabBarStyle: BEUITabBarStyle {
  public var tabBarBackgroundImageOrNil: UIImage? = UIImage.imageCreate(color: UIColor.lightText)
  public var tabBarShadowImageOrNil: UIImage? = nil
  public var tabBarBarTintColorOrNil: UIColor? = nil
  public var tabBarTintColorOrNil: UIColor? = UIColor(red: 0x32/255.0, green: 0xcd/255.0, blue: 0x32/255.0, alpha: 1)
  public var tabBarStyle: UIBarStyle = .default
  public var tabBarTranslucent = true
  public var tabBarItemTitleColorOrNil: UIColor? = nil
  public var tabBarItemTitleColorSelectedOrNil: UIColor? = nil
  public var tabBarItemTitleFontOrNil: UIFont? = nil
}

struct UIOtherStyle: BEUIOtherStyle {
  public var supportedOrientationMask: UIInterfaceOrientationMask = .portrait
  public var statusbarStyleLightInitially: Bool = true
  public var hidesBottomBarWhenPushedInitially: Bool = false
  public var needsBackBarButtonItemTitle: Bool = false
  public var preventConcurrentNavigationControllerTransitions: Bool = true
  public var navigationBarHiddenInitially: Bool = false
}
