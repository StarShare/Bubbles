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
    guard controller == controller.navigationController?.topViewController else { return }
    
    if controller.appearance.shouldSetStatusBarStyleLight {
      if UIApplication.shared.statusBarStyle != .lightContent {
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: animated)
      }
    } else {
      if UIApplication.shared.statusBarStyle != .default {
        UIApplication.shared.setStatusBarStyle(.default, animated: animated)
      }
    }
    
    guard let navController = controller.navigationController else { return }
    
    if controller.transition.shouldCustomizeNavigationBarTransitionIfHideable {
      if controller.transition.preferredNavigationBarHidden {
        if navController.isNavigationBarHidden == false {
          navController.setNavigationBarHidden(true, animated: animated)
        }
      } else {
        if navController.isNavigationBarHidden == true {
          navController.setNavigationBarHidden(false, animated: animated)
        }
      }
    }
    
    navController.navigationBar.setBackgroundImage(controller.appearance.navigationBarBackgroundImageOrNil, for: .default)
    navController.navigationBar.shadowImage = controller.appearance.navigationBarShadowImageOrNil
    navController.navigationBar.tintColor = controller.appearance.navigationBarTintColorOrNil
  }
}
