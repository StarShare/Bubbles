//
//  BEUICommonDefines.swift
//  Bubbles
//
//  Created by god on 2018/8/25.
//  Copyright © 2018 God. All rights reserved.
//

import Foundation
import UIKit

let IOS8_SDK_ALLOWED  = __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
let IOS9_SDK_ALLOWED  = __IPHONE_OS_VERSION_MAX_ALLOWED >= 90000
let IOS10_SDK_ALLOWED = __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
let IOS11_SDK_ALLOWED = __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000
let IOS_VERSION = Double(UIDevice.current.systemVersion)

let IS_LANDSCAPE = UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation)
let IS_DEVICE_LANDSCAPE = UIDeviceOrientationIsLandscape(UIDevice.current.orientation)

let SCREEN_WIDTH  = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let DEVICE_WIDTH  = IS_LANDSCAPE ? SCREEN_HEIGHT : SCREEN_WIDTH
let DEVICE_HEIGHT = IS_LANDSCAPE ? SCREEN_WIDTH  : SCREEN_HEIGHT

let SCREEN_SIZE_58INCH = CGSize(width: 375, height: 812)
let SCREEN_SIZE_55INCH = CGSize(width: 414, height: 736)
let SCREEN_SIZE_47INCH = CGSize(width: 375, height: 667)
let SCREEN_SIZE_40INCH = CGSize(width: 320, height: 568)
let SCREEN_SIZE_35INCH = CGSize(width: 320, height: 480)

let IS_58INCH_SCREEN   = DEVICE_WIDTH == SCREEN_SIZE_58INCH.width && DEVICE_HEIGHT == SCREEN_SIZE_58INCH.height
let IS_55INCH_SCREEN   = DEVICE_WIDTH == SCREEN_SIZE_55INCH.width && DEVICE_HEIGHT == SCREEN_SIZE_55INCH.height
let IS_47INCH_SCREEN   = DEVICE_WIDTH == SCREEN_SIZE_47INCH.width && DEVICE_HEIGHT == SCREEN_SIZE_47INCH.height
let IS_40INCH_SCREEN   = DEVICE_WIDTH == SCREEN_SIZE_40INCH.width && DEVICE_HEIGHT == SCREEN_SIZE_40INCH.height
let IS_35INCH_SCREEN   = DEVICE_WIDTH == SCREEN_SIZE_35INCH.width && DEVICE_HEIGHT == SCREEN_SIZE_35INCH.height
let IS_320WIDTH_SCREEN = IS_35INCH_SCREEN || IS_40INCH_SCREEN
let IS_RETINASCREEN    = UIScreen.main.scale >= 2.0
let IS_IPHONEX         = IS_58INCH_SCREEN && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone

let ScreenBoundsSize = UIScreen.main.bounds.size
let ScreenNativeBoundsSize = UIScreen.main.nativeBounds.size
let ScreenScale = UIScreen.main.scale
let ScreenNativeScale = UIScreen.main.nativeScale
let StatusBarHeight = UIApplication.shared.isStatusBarHidden ? 0 : UIApplication.shared.statusBarFrame.size.height
let NavigationBarHeight: CGFloat = 44.0
let ToolBarHeight = IS_IPHONEX ? 83 : 44
let TabBarHeight = IS_IPHONEX ? 83 : 49
let NavigationContentStaticHeight = StatusBarHeight + NavigationBarHeight
