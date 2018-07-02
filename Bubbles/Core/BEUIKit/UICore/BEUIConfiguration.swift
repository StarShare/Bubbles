
import UIKit

public struct BEUIConfiguration: BEUIStyle {
  
  public static var style: BEUIStyle = BEUIConfiguration()
  
  public var colorStyle: BEUIColorStyle = BEUIDefaultColorStyle()
  public var controlStyle: BEUIControlStyle = BEUIDefaultControlStyle()
  public var buttonStyle: BEUIButtonStyle = BEUIDefaultButtonStyle()
  public var textFieldStyle: BEUITextFieldStyle = BEUIDefaultTextFieldStyle()
  public var viewControllerStyle: BEUIViewControllerStyle = BEUIDefaultViewControllerStyle()
  public var navigationBarStyle: BEUINavigationBarStyle = BEUIDefaultNavigationBarStyle()
  public var tabBarStyle: BEUITabBarStyle = BEUIDefaultTabBarStyle()
  public var toolbarStyle: BEUIToolBarStyle = BEUIDefaultToolBarStyle()
  public var searchBarStyle: BEUISearchBarStyle = BEUIDefaultSearchBarStyle()
  public var tableStyle: BEUITableStyle = BEUIDefaultTableStyle()
  public var windowLevelStyle: BEUIWindowLevelStyle = BEUIDefaultWindowLevelStyle()
  public var otherStyle: BEUIOtherStyle = BEUIDefaultOtherStyle()
}

struct BEUIDefaultColorStyle: BEUIColorStyle {
  public var clearColor: UIColor = .clear
  public var whiteColor: UIColor = .white
  public var blackColor: UIColor = .black
  public var grayColor: UIColor = .gray
  public var grayDarkenColor: UIColor = .darkGray
  public var grayLightenColor: UIColor = .lightGray
  public var redColor: UIColor = .red
  public var greenColor: UIColor = .green
  public var blueColor: UIColor = .blue
  public var yellowColor: UIColor = .yellow
  public var linkColor: UIColor = UIColor(red: 0.220, green: 0.455, blue: 0.670, alpha: 1)
  public var disabledColor: UIColor = .gray
  public var maskDarkColor: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.35)
  public var maskLightColor: UIColor = UIColor(red: 1, green: 1, blue: 01, alpha: 0.5)
  public var separatorColor: UIColor = UIColor(red: 0.870, green: 0.878, blue: 0.886, alpha: 1)
  public var separatorDashedColor: UIColor = UIColor(red: 0.067, green: 0.067, blue: 0.067, alpha: 1)
  public var textPlaceholderColor: UIColor = UIColor(red: 0.767, green: 0.784, blue: 0.816, alpha: 1)
  public var imagePlaceholderColorOrNil: UIColor? = nil
}

struct BEUIDefaultControlStyle: BEUIControlStyle {
  public var controlHighlightedAlpha: CGFloat = 0.5
  public var controlDisabledAlpha: CGFloat = 0.5
}

struct BEUIDefaultButtonStyle: BEUIButtonStyle {
  public var buttonHighlightedAlpha: CGFloat = 0.5
  public var buttonDisabledAlpha: CGFloat = 0.5
  public var buttonTintColorOrNil: UIColor? = nil
}

struct BEUIDefaultTextFieldStyle: BEUITextFieldStyle {
  public var textFieldTintColorOrNil: UIColor? = nil
  public var textFieldTextInsets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
}

struct BEUIDefaultViewControllerStyle: BEUIViewControllerStyle {
  public var backgroundColorOrNil: UIColor? = .white
}

struct BEUIDefaultNavigationBarStyle: BEUINavigationBarStyle {
  public var navBarHighlightedAlpha: CGFloat = 0.2
  public var navBarDisabledAlpha: CGFloat = 0.2
  public var navBarButtonFontOrNil: UIFont? = nil
  public var navBarButtonFontBoldOrNil: UIFont? = nil
  public var navBarBackgroundImageOrNil: UIImage? = nil
  public var navBarShadowImageOrNil: UIImage? = nil
  public var navBarBarTintColorOrNil: UIColor? = nil
  public var navBarTintColorOrNil: UIColor? = nil
  public var navBarStyle: UIBarStyle = .default
  public var navBarTranslucent = true
  public var navBarTitleColorOrNil: UIColor? = nil
  public var navBarTitleFontOrNil: UIFont? = nil
  public var navBarBackIndicatorImageOrNil: UIImage? = nil
}

struct BEUIDefaultTabBarStyle: BEUITabBarStyle {
  public var tabBarBackgroundImageOrNil: UIImage? = nil
  public var tabBarShadowImageOrNil: UIImage? = nil
  public var tabBarBarTintColorOrNil: UIColor? = nil
  public var tabBarTintColorOrNil: UIColor? = nil
  public var tabBarStyle: UIBarStyle = .default
  public var tabBarTranslucent = true
  public var tabBarItemTitleColorOrNil: UIColor? = nil
  public var tabBarItemTitleColorSelectedOrNil: UIColor? = nil
  public var tabBarItemTitleFontOrNil: UIFont? = nil
}

struct BEUIDefaultToolBarStyle: BEUIToolBarStyle {
  public var toolBarHighlightedAlpha: CGFloat = 0.4
  public var toolBarDisabledAlpha: CGFloat = 0.4
  public var toolBarBackgroundImageOrNil: UIImage? = nil
  public var toolBarShadowImageOrNil: UIImage? = nil
  public var toolBarBarTintColorOrNil: UIColor? = nil
  public var toolBarTintColorOrNil: UIColor? = nil
  public var toolBarTintColorHighlightedOrNil: UIColor? = nil
  public var toolBarTintColorDisabledOrNil: UIColor? = nil
  public var toolBarButtonFontOrNil: UIFont? = nil
}

struct BEUIDefaultSearchBarStyle: BEUISearchBarStyle {
  public var searchBarTextFieldBackgroundColorOrNil: UIColor? = nil
  public var searchBarTextFieldBorderColorOrNil: UIColor? = nil
  public var searchBarBottomBorderColorOrNil: UIColor? = nil
  public var searchBarBarTintColorOrNil: UIColor? = nil
  public var searchBarTintColorOrNil: UIColor? = nil
  public var searchBarTextColorOrNil: UIColor? = nil
  public var searchBarPlaceholderColorOrNil: UIColor? = nil
  public var searchBarTextFontOrNil: UIFont? = nil
  public var searchBarSearchIconImageOrNil: UIImage? = nil
  public var searchBarClearIconImageOrNil: UIImage? = nil
  public var searchBarTextFieldCornerRadius: CGFloat = 2.0
}

struct BEUIDefaultTableStyle: BEUITableStyle {
  public var tableViewEstimatedHeightEnabled: Bool = true
  public var tableViewPlainBackgroundColorOrNil: UIColor? = nil
  public var tableViewGroupedBackgroundColorOrNil: UIColor? = nil
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

struct BEUIDefaultWindowLevelStyle: BEUIWindowLevelStyle {
  public var windowLevelUIModalPresentationView: UIWindowLevel = UIWindowLevelAlert - 4.0
  public var windowLevelUIImagePreviewView: UIWindowLevel = UIWindowLevelStatusBar + 1.0
}

struct BEUIDefaultOtherStyle: BEUIOtherStyle {
  public var supportedOrientationMask: UIInterfaceOrientationMask = .portrait
  public var statusbarStyleLightInitially: Bool = false
  public var hidesBottomBarWhenPushedInitially: Bool = false
  public var needsBackBarButtonItemTitle: Bool = false
  public var preventConcurrentNavigationControllerTransitions: Bool = true
  public var navigationBarHiddenInitially: Bool = false
}
