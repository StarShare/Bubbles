
import UIKit

struct UINavigationBarStyle: BEUINavigationBarStyle {
  public var navBarHighlightedAlpha: CGFloat = 0.2
  public var navBarDisabledAlpha: CGFloat = 0.2
  public var navBarButtonFontOrNil: UIFont? = nil
  public var navBarButtonFontBoldOrNil: UIFont? = nil
  public var navBarBackgroundImageOrNil: UIImage? = UIImage.imageCreate(color: UIColor.groupTableViewBackground)
  public var navBarShadowImageOrNil: UIImage? = nil
  public var navBarBarTintColorOrNil: UIColor? = nil
  public var navBarTintColorOrNil: UIColor? = nil
  public var navBarStyle: UIBarStyle = .default
  public var navBarTranslucent = false
  public var navBarTitleColorOrNil: UIColor? = .black
  public var navBarTitleFontOrNil: UIFont? = UIFont.boldSystemFont(ofSize: 20)
  public var navBarBackIndicatorImageOrNil: UIImage? = nil
}
