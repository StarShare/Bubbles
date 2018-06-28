//
//  BEUIStyle.swift
//  Bubbles
//
//  Created by god on 2018/6/26.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

public protocol BEUIStyle {
  
  /// The style of Color
  var colorStyle: BEUIColorStyle { get set }
  
  /// The style of Control
  var controlStyle: BEUIControlStyle { get set }
  
  /// The style of Button
  var buttonStyle: BEUIButtonStyle { get set }
  
  /// The style of TextField
  var textFieldStyle: BEUITextFieldStyle { get set }
  
  /// The style of ViewController
  var viewControllerStyle: BEUIViewControllerStyle { get set }
  
  /// The style of NavigationBar
  var navigationBarStyle: BEUINavigationBarStyle { get set }
  
  /// The style of TabBar
  var tabBarStyle: BEUITabBarStyle { get set }
  
  /// The style of Toolbar
  var toolbarStyle: BEUIToolBarStyle { get set }
  
  /// The style of SearchBar
  var searchBarStyle: BEUISearchBarStyle { get set }
  
  /// The style of Table
  var tableStyle: BEUITableStyle { get set }
  
  /// The style of WindowLevel
  var windowLevelStyle: BEUIWindowLevelStyle { get set }
  
  /// The style of Other
  var otherStyle: BEUIOtherStyle { get set }
}

public protocol BEUIColorStyle {
  
  /// The color of clear
  var clearColor: UIColor { get }
  
  /// The color of white
  var whiteColor: UIColor { get }
  
  /// The color of black
  var blackColor: UIColor { get }
  
  /// The color of gray
  var grayColor: UIColor { get }
  
  /// The color of grayDarken
  var grayDarkenColor: UIColor { get }
  
  /// The color of grayLighten
  var grayLightenColor: UIColor { get }
  
  /// The color of red
  var redColor: UIColor { get }
  
  /// The color of green
  var greenColor: UIColor { get }
  
  /// The color of blue
  var blueColor: UIColor { get }
  
  /// The color of yellow
  var yellowColor: UIColor { get }
  
  /// The color of link
  var linkColor: UIColor { get }
  
  /// The color of disabled
  var disabledColor: UIColor { get }
  
  /// The color of maskDark
  var maskDarkColor: UIColor { get }
  
  /// The color of maskLight
  var maskLightColor: UIColor { get }
  
  /// The color of separator
  var separatorColor: UIColor { get }
  
  /// The color of separatorDashed
  var separatorDashedColor: UIColor { get }
  
  /// The color of UITextField,UITextView placeholder
  var textPlaceholderColor: UIColor { get }
  
  /// The color of UIImageView placeholder
  var imagePlaceholderColorOrNil: UIColor? { get }
}

public protocol BEUIControlStyle {
  
  /// The alpha of control highlighted
  var controlHighlightedAlpha: CGFloat { get }
  
  /// The alpha of control disabled
  var controlDisabledAlpha: CGFloat { get }
}

public protocol BEUIButtonStyle {
  
  /// The alpha of button highlighted
  var buttonHighlightedAlpha: CGFloat { get }
  
  /// The alpha of button disabled
  var buttonDisabledAlpha: CGFloat { get }
  
  /// The color of UIButton TintColor
  var buttonTintColorOrNil: UIColor? { get }
}

public protocol BEUITextFieldStyle {
  
  /// The color of UITextField TintColor
  var textFieldTintColorOrNil: UIColor? { get }
  
  /// The Insets of UITextField TextInsets
  var textFieldTextInsets: UIEdgeInsets { get }
}

public protocol BEUIViewControllerStyle {
  
  /// The color of UIViewController,UITableViewController background
  var backgroundColorOrNil: UIColor? { get }
}

public protocol BEUINavigationBarStyle {
  
  /// The alpha of navBar highlighted
  var navBarHighlightedAlpha: CGFloat { get }
  
  /// The alpha of navBar disabled
  var navBarDisabledAlpha: CGFloat { get }
  
  /// The font of navBarButton
  var navBarButtonFontOrNil: UIFont? { get }
  
  /// The boldFont of navBarButton
  var navBarButtonFontBoldOrNil: UIFont? { get }
  
  /// The image of navBarBackground
  var navBarBackgroundImageOrNil: UIImage? { get }
  
  /// The image of navBarShadow
  var navBarShadowImageOrNil: UIImage? { get }
  
  /// The color of navBarBar TintColor
  var navBarBarTintColorOrNil: UIColor? { get }
  
  /// The color of navBar TintColor
  var navBarTintColorOrNil: UIColor? { get }
  
  /// The color of navBarTitle
  var navBarTitleColorOrNil: UIColor? { get }
  
  /// The font of navBarTitle
  var navBarTitleFontOrNil: UIFont? { get }
  
  /// The color of navBarLargeTitle
  var navBarLargeTitleColorOrNil: UIColor? { get }
  
  /// The font of navBarLargeTitle
  var navBarLargeTitleFontOrNil: UIFont? { get }
  
  /// The image of navBarBackIndicator
  var navBarBackIndicatorImageOrNil: UIImage? { get }
  
  /// The Margin of navBarLoading Right
  var navBarLoadingMarginRight: CGFloat { get }
  
  /// The Margin of navBarAccessoryView Left
  var navBarAccessoryViewMarginLeft: CGFloat { get }
  
  /// The IndicatorViewStyle of navBarActivity
  var navBarActivityIndicatorViewStyle: UIActivityIndicatorView.Style { get }
}

public protocol BEUITabBarStyle {
  
  /// The image of tabBarBackground
  var tabBarBackgroundImageOrNil: UIImage? { get }
  
  /// The image of tabBarShadow
  var tabBarShadowImageOrNil: UIImage? { get }
  
  /// The color of tabBarBar TintColor
  var tabBarBarTintColorOrNil: UIColor? { get }
  
  /// The color of tabBar TintColor
  var tabBarTintColorOrNil: UIColor? { get }
  
  /// The color of tabBarItemTitle
  var tabBarItemTitleColorOrNil: UIColor? { get }
  
  /// The color of tabBar tabBarItemTitle Selected
  var tabBarItemTitleColorSelectedOrNil: UIColor? { get }
  
  /// The font of tabBarItemTitle
  var tabBarItemTitleFontOrNil: UIFont? { get }
}

public protocol BEUIToolBarStyle {
  
  /// The alpha of toolBar highlighted
  var toolBarHighlightedAlpha: CGFloat { get }
  
  /// The alpha of toolBar disabled
  var toolBarDisabledAlpha: CGFloat { get }
  
  /// The image of toolBarBackground
  var toolBarBackgroundImageOrNil: UIImage? { get }
  
  /// The image of toolBarShadow
  var toolBarShadowImageOrNil: UIImage? { get }
  
  /// The color of toolBarBar TintColor
  var toolBarBarTintColorOrNil: UIColor? { get }
  
  /// The color of tabBar TintColor
  var toolBarTintColorOrNil: UIColor? { get }
  
  /// The color of toolBarTint Highlighted
  var toolBarTintColorHighlightedOrNil: UIColor? { get }
  
  /// The color of toolBarTint Disabled
  var toolBarTintColorDisabledOrNil: UIColor? { get }
  
  /// The font of toolBarButton
  var toolBarButtonFontOrNil: UIFont? { get }
}

public protocol BEUISearchBarStyle {
  
  /// The color of searchBarTextField Background
  var searchBarTextFieldBackgroundColorOrNil: UIColor? { get }
  
  /// The color of searchBarTextField Border
  var searchBarTextFieldBorderColorOrNil: UIColor? { get }
  
  /// The color of searchBarBottom Border
  var searchBarBottomBorderColorOrNil: UIColor? { get }
  
  /// The color of searchBarBar TintColor
  var searchBarBarTintColorOrNil: UIColor? { get }
  
  /// The color of searchBar TintColor
  var searchBarTintColorOrNil: UIColor? { get }
  
  /// The color of searchBarText
  var searchBarTextColorOrNil: UIColor? { get }
  
  /// The color of searchBarPlaceholder
  var searchBarPlaceholderColorOrNil: UIColor? { get }
  
  /// The font of searchBarText
  var searchBarTextFontOrNil: UIFont? { get }
  
  /// The image of searchBar SearchIcon
  /// size must be {13pt,13pt}
  var searchBarSearchIconImageOrNil: UIImage? { get }
  
  /// The image of searchBar ClearIcon
  var searchBarClearIconImageOrNil: UIImage? { get }
  
  /// The CornerRadius of searchBarTextField
  var searchBarTextFieldCornerRadius: CGFloat { get }
}

public protocol BEUITableStyle {
  
  /// The Enabled of tableViewEstimatedHeight
  var tableViewEstimatedHeightEnabled: Bool { get }
  
  /// The color of tableViewPlain Background
  var tableViewPlainBackgroundColorOrNil: UIColor? { get }
  
  /// The color of tableViewGrouped Background
  var tableViewGroupedBackgroundColorOrNil: UIColor? { get }
  
  /// The color of tableSectionIndex
  var tableSectionIndexColorOrNil: UIColor? { get }
  
  /// The color of tableSectionIndex Background
  var tableSectionIndexBackgroundColorOrNil: UIColor? { get }
  
  /// The color of tableSectionIndex TrackingBackground
  var tableSectionIndexTrackingBackgroundColorOrNil: UIColor? { get }
  
  /// The color of tableView Separator
  var tableViewSeparatorColorOrNil: UIColor? { get }
  
  // MARK: - TableViewHeader & Plain
  
  /// The color of tableViewPlain SectionHeaderBackground
  var tableViewPlainSectionHeaderBackgroundColorOrNil: UIColor? { get }
  
  /// The color of tableViewPlain SectionFooterBackground
  var tableViewPlainSectionFooterBackgroundColorOrNil: UIColor? { get }
  
  /// The font of tableViewPlain SectionHeaderFont
  var tableViewPlainSectionHeaderFontOrNil: CGFont? { get }
  
  /// The font of tableViewPlain SectionFooterFont
  var tableViewPlainSectionFooterFontOrNil: CGFont? { get }
  
  /// The color of tableViewPlain SectionHeaderText
  var tableViewPlainSectionHeaderTextColorOrNil: UIColor? { get }
  
  /// The color of tableViewPlain SectionFooterBackground
  var tableViewPlainSectionFooterTextColorOrNil: UIColor? { get }
  
  /// The Insets of tableViewPlain SectionHeaderAccessory
  var tableViewPlainSectionHeaderAccessoryMargins: UIEdgeInsets { get }
  
  /// The Insets of tableViewPlain SectionFooterAccessory
  var tableViewPlainSectionFooterAccessoryMargins: UIEdgeInsets { get }
  
  /// The Insets of tableViewPlain SectionHeaderContent
  var tableViewPlainSectionHeaderContentInset: UIEdgeInsets { get }
  
  /// The Insets of tableViewPlain SectionFooterContent
  var tableViewPlainSectionFooterContentInset: UIEdgeInsets { get }
  
  // MARK: - TableViewHeader & Grouped
  
  /// The color of tableViewGrouped SectionHeaderBackground
  var tableViewGroupedSectionHeaderBackgroundColorOrNil: UIColor? { get }
  
  /// The color of tableViewGrouped SectionFooterBackground
  var tableViewGroupedSectionFooterBackgroundColorOrNil: UIColor? { get }
  
  /// The font of tableViewGrouped SectionHeaderFont
  var tableViewGroupedSectionHeaderFontOrNil: CGFont? { get }
  
  /// The font of tableViewGrouped SectionFooterFont
  var tableViewGroupedSectionFooterFontOrNil: CGFont? { get }
  
  /// The color of tableViewGrouped SectionHeaderText
  var tableViewGroupedSectionHeaderTextColorOrNil: UIColor? { get }
  
  /// The color of tableViewGrouped SectionFooterBackground
  var tableViewGroupedSectionFooterTextColorOrNil: UIColor? { get }
  
  /// The Insets of tableViewGrouped SectionHeaderAccessory
  var tableViewGroupedSectionHeaderAccessoryMargins: UIEdgeInsets { get }
  
  /// The Insets of tableViewGrouped SectionFooterAccessory
  var tableViewGroupedSectionFooterAccessoryMargins: UIEdgeInsets { get }
  
  /// The Insets of tableViewGrouped SectionHeaderContent
  var tableViewGroupedSectionHeaderContentInset: UIEdgeInsets { get }
  
  /// The Insets of tableViewGrouped SectionFooterContent
  var tableViewGroupedSectionFooterContentInset: UIEdgeInsets { get }
  
  /// The Default Height of tableViewGrouped SectionHeader
  var tableViewGroupedSectionHeaderDefaultHeight: CGFloat { get }
  
  /// The Default Height of tableViewGrouped SectionFooter
  var tableViewGroupedSectionFooterDefaultHeight: CGFloat { get }
  
  // MARK: - TableViewCell
  
  /// The Normal Height of tableViewCell
  var tableViewCellNormalHeight: CGFloat { get }
  
  /// The color of tableViewCell Background
  var tableViewCellBackgroundColorOrNil: UIColor? { get }
  
  /// The color of tableViewCell SelectedBackground
  var tableViewCellSelectedBackgroundColorOrNil: UIColor? { get }
  
  /// The color of tableViewCell WarningBackground
  var tableViewCellWarningBackgroundColorOrNil: UIColor? { get }
  
  /// The color of tableViewCell TitleLabel
  var tableViewCellTitleLabelColorOrNil: UIColor? { get }
  
  /// The color of tableViewCell DetailLabel
  var tableViewCellDetailLabelColorOrNil: UIColor? { get }
  
  /// The image of tableViewCell DisclosureIndicator
  var tableViewCellDisclosureIndicatorImageOrNil: UIImage? { get }
  
  /// The image of tableViewCell DetailButton
  var tableViewCellDetailButtonImageOrNil: UIImage? { get }
  
  /// The image of tableViewCell DisclosureIndicator
  var tableViewCellCheckmarkImageOrNil: UIImage? { get }
  
  /// The image of tableViewCell Badge
  var tableViewCellBadgeImageOrNil: UIImage? { get }
  
  /// The Spacing of tableViewCell Badge,DisclosureIndicator
  var tableViewCellSpacingBetweenBadgeAndDisclosureIndicator: CGFloat { get }
}

public protocol BEUIWindowLevelStyle {
  
  /// The windowLevel of UIAlertView
  var windowLevelUIModalPresentationView: UIWindow.Level { get }
  
  /// The windowLevel of UIImagePreviewView
  var windowLevelUIImagePreviewView: UIWindow.Level { get }
}

public protocol BEUIOtherStyle {
  
  /// The Orientation of Interface
  var supportedOrientationMask: UIInterfaceOrientationMask { get }
  
  /// The Enabled of automaticallyRotateDeviceOrientation
  var automaticallyRotateDeviceOrientation: Bool { get }
  
  /// The Enabled of statusbarStyleLightInitially
  var statusbarStyleLightInitially: Bool { get }
  
  /// The Enabled of hidesBottomBarWhenPushedInitially
  var hidesBottomBarWhenPushedInitially: Bool { get }
  
  /// The Enabled of needsBackBarButtonItemTitle
  var needsBackBarButtonItemTitle: Bool { get }
  
  // The Enabled of preventConcurrentNavigationControllerTransitions
  var preventConcurrentNavigationControllerTransitions: Bool { get }
  
  // The Enabled of navigationBarHiddenInitially
  var navigationBarHiddenInitially: Bool { get }
}
