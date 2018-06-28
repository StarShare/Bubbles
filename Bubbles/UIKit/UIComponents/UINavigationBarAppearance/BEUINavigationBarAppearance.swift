//
//  BEUINavigationBarAppearance.swift
//  Bubbles
//
//  Created by god on 2018/6/28.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

public protocol BEUINavigationBarAppearance {
  
  /// The Enabled of StatusBarStyleLight
  var shouldSetStatusBarStyleLight: Bool { get set }
  
  /// The color of titleViewTintColor
  var titleViewTintColorOrNil: UIColor? { get set }
  
  /// The image of navigationBarBackgroundImage
  var navigationBarBackgroundImageOrNil: UIImage? { get set }
  
  /// The image of navigationBarShadowImage
  var navigationBarShadowImageOrNil: UIImage? { get set }
  
  /// The color of navigationBarTintColor
  var navigationBarTintColorOrNil: UIColor? { get set }
  
  /// The string of backBarButtonItemTitle
  var backBarButtonItemTitleOrNil: String? { get set }
}

public extension BEUIViewController {
  
  /// Render NavigationBar Style
  func renderNavigationStyle(_ controller: BEUIViewController, animated: Bool) {
    guard controller.navigationController?.topViewController == controller else { return }
    
    if controller.appearance.shouldSetStatusBarStyleLight {
      if UIApplication.shared.statusBarStyle != .lightContent {
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: animated)
      }
    } else {
      if UIApplication.shared.statusBarStyle != .default {
        UIApplication.shared.setStatusBarStyle(.default, animated: animated)
      }
    }
    
    if controller.transition.shouldCustomizeNavigationBarTransitionIfHideable {
      if controller.transition.preferredNavigationBarHidden {
        if controller.navigationController?.isNavigationBarHidden == false {
          controller.navigationController?.setNavigationBarHidden(true, animated: animated)
        }
      } else {
        if controller.navigationController?.isNavigationBarHidden == true {
          controller.navigationController?.setNavigationBarHidden(false, animated: animated)
        }
      }
    }
    
    controller.navigationController?.navigationBar.setBackgroundImage(controller.appearance.navigationBarBackgroundImageOrNil, for: .default)
    controller.navigationController?.navigationBar.shadowImage = controller.appearance.navigationBarShadowImageOrNil
    controller.navigationController?.navigationBar.tintColor = controller.appearance.navigationBarTintColorOrNil
  }
}
