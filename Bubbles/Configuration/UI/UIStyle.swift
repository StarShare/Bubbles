
import UIKit

struct UINavigationBarStyle: BEUINavigationBarStyle {
  public var navBarHighlightedAlpha: CGFloat = 0.2
  public var navBarDisabledAlpha: CGFloat = 0.2
  public var navBarButtonFontOrNil: UIFont? = nil
  public var navBarButtonFontBoldOrNil: UIFont? = nil
  public var navBarBackgroundImageOrNil: UIImage? = UIImage.imageCreate(color: UIColor(red: 30/255.0, green: 32/255.0, blue: 40/255.0, alpha: 1.0))
  public var navBarShadowImageOrNil: UIImage? = nil
  public var navBarBarTintColorOrNil: UIColor? = nil
  public var navBarTintColorOrNil: UIColor? = nil
  public var navBarStyle: UIBarStyle = .default
  public var navBarTranslucent = false
  public var navBarTitleColorOrNil: UIColor? = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1)
  public var navBarTitleFontOrNil: UIFont? = UIFont.boldSystemFont(ofSize: 18)
  public var navBarBackIndicatorImageOrNil: UIImage? = nil
}

struct UITabBarStyle: BEUITabBarStyle {
  public var tabBarBackgroundImageOrNil: UIImage? = UIImage.imageCreate(color: UIColor.lightText)
  public var tabBarShadowImageOrNil: UIImage? = nil
  public var tabBarBarTintColorOrNil: UIColor? = nil
  public var tabBarTintColorOrNil: UIColor? = nil
  public var tabBarStyle: UIBarStyle = .default
  public var tabBarTranslucent = true
  public var tabBarItemTitleColorOrNil: UIColor? = nil
  public var tabBarItemTitleColorSelectedOrNil: UIColor? = nil
  public var tabBarItemTitleFontOrNil: UIFont? = nil
}

struct UIOtherStyle: BEUIOtherStyle {
  public var supportedOrientationMask: UIInterfaceOrientationMask = .all
  public var statusbarStyleLightInitially: Bool = false
  public var hidesBottomBarWhenPushedInitially: Bool = false
  public var needsBackBarButtonItemTitle: Bool = false
  public var preventConcurrentNavigationControllerTransitions: Bool = true
  public var navigationBarHiddenInitially: Bool = false
}

struct UITableStyle: BEUITableStyle {
  public var tableViewEstimatedHeightEnabled: Bool = true
  public var tableViewPlainBackgroundColorOrNil: UIColor? = .groupTableViewBackground
  public var tableViewGroupedBackgroundColorOrNil: UIColor? = .groupTableViewBackground
  public var tableSectionIndexColorOrNil: UIColor? = nil
  public var tableSectionIndexBackgroundColorOrNil: UIColor? = nil
  public var tableSectionIndexTrackingBackgroundColorOrNil: UIColor? = nil
  public var tableViewSeparatorColorOrNil: UIColor? = nil
  public var tableViewPlainSectionHeaderBackgroundColorOrNil: UIColor? = nil
  public var tableViewPlainSectionFooterBackgroundColorOrNil: UIColor? = nil
  public var tableViewPlainSectionHeaderFontOrNil: CGFont? = nil
  public var tableViewPlainSectionFooterFontOrNil: CGFont? = nil
  public var tableViewPlainSectionHeaderTextColorOrNil: UIColor? = nil
  public var tableViewPlainSectionFooterTextColorOrNil: UIColor? = nil
  public var tableViewPlainSectionHeaderAccessoryMargins: UIEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
  public var tableViewPlainSectionFooterAccessoryMargins: UIEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
  public var tableViewPlainSectionHeaderContentInset: UIEdgeInsets = UIEdgeInsets(top: 4, left: 15, bottom: 4, right: 15)
  public var tableViewPlainSectionFooterContentInset: UIEdgeInsets = UIEdgeInsets(top: 4, left: 15, bottom: 4, right: 15)
  public var tableViewGroupedSectionHeaderBackgroundColorOrNil: UIColor? = nil
  public var tableViewGroupedSectionFooterBackgroundColorOrNil: UIColor? = nil
  public var tableViewGroupedSectionHeaderFontOrNil: CGFont? = nil
  public var tableViewGroupedSectionFooterFontOrNil: CGFont? = nil
  public var tableViewGroupedSectionHeaderTextColorOrNil: UIColor? = nil
  public var tableViewGroupedSectionFooterTextColorOrNil: UIColor? = nil
  public var tableViewGroupedSectionHeaderAccessoryMargins: UIEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
  public var tableViewGroupedSectionFooterAccessoryMargins: UIEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
  public var tableViewGroupedSectionHeaderContentInset: UIEdgeInsets = UIEdgeInsets(top: 16, left: 15, bottom: 8, right: 15)
  public var tableViewGroupedSectionFooterContentInset: UIEdgeInsets = UIEdgeInsets(top: 8, left: 15, bottom: 2, right: 15)
  public var tableViewGroupedSectionHeaderDefaultHeight: CGFloat = 44
  public var tableViewGroupedSectionFooterDefaultHeight: CGFloat = 44
  public var tableViewCellNormalHeight: CGFloat = 44
  public var tableViewCellBackgroundColorOrNil: UIColor? = nil
  public var tableViewCellSelectedBackgroundColorOrNil: UIColor? = nil
  public var tableViewCellWarningBackgroundColorOrNil: UIColor? = nil
  public var tableViewCellTitleLabelColorOrNil: UIColor? = nil
  public var tableViewCellDetailLabelColorOrNil: UIColor? = nil
  public var tableViewCellDisclosureIndicatorImageOrNil: UIImage? = nil
  public var tableViewCellDetailButtonImageOrNil: UIImage? = nil
  public var tableViewCellCheckmarkImageOrNil: UIImage? = nil
  public var tableViewCellBadgeImageOrNil: UIImage? = nil
  public var tableViewCellSpacingBetweenBadgeAndDisclosureIndicator: CGFloat = 12
}
