
import UIKit

public protocol BEUINavigationBarAppearance {
  
  /// The Enabled of StatusBarStyleLight
  var shouldSetStatusBarStyleLight: Bool { get set }
  
  /// The color of titleViewTintColor
  var titleViewTintColorOrNil: UIColor? { get set }
  
  /// The font of titleView titleLabel
  var titleViewFontOrNil: UIFont? { get set }
  
  /// The image of navigationBarBackgroundImage
  var navigationBarBackgroundImageOrNil: UIImage? { get set }
  
  /// The image of navigationBarShadowImage
  var navigationBarShadowImageOrNil: UIImage? { get set }
  
  /// The color of navigationBarTintColor
  var navigationBarTintColorOrNil: UIColor? { get set }
  
  /// The string of backBarButtonItemTitle
  var backBarButtonItemTitleOrNil: String? { get set }
}

internal extension BEUIViewController {
  
  /// Render NavigationBar Style
  func renderNavigationStyle(_ controller: BEUIViewController, animated: Bool) {
    if controller.appearance.shouldSetStatusBarStyleLight {
      if UIApplication.shared.statusBarStyle != .lightContent {
        //UIApplication.shared.setStatusBarStyle(.lightContent, animated: animated)
      }
    } else {
      if UIApplication.shared.statusBarStyle != .`default` {
        //UIApplication.shared.setStatusBarStyle(.`default`, animated: animated)
      }
    }
    
    guard controller == controller.navigationController?.topViewController else { return }
    guard let navController = controller.navigationController else { return }
    
    if controller.transition.shouldCustomizeNavigationBarTransitionIfHideable {
      if controller.transition.preferredNavigationBarHidden {
        if navController.isNavigationBarHidden {
          navController.setNavigationBarHidden(true, animated: animated)
        }
      } else {
        if navController.isNavigationBarHidden {
          navController.setNavigationBarHidden(false, animated: animated)
        }
      }
    }
    
    if controller.appearance.navigationBarBackgroundImageOrNil != nil {
      let backgroundImage = controller.appearance.navigationBarBackgroundImageOrNil
      navController.navigationBar.setBackgroundImage(backgroundImage, for: .default)
    } else {
      let backgroundImage = BEUIConfiguration.style.navigationBarStyle.navBarBackgroundImageOrNil
      navController.navigationBar.setBackgroundImage(backgroundImage, for: .default)
    }
    
    if controller.appearance.navigationBarShadowImageOrNil != nil {
      let shadowImage = controller.appearance.navigationBarShadowImageOrNil
      navController.navigationBar.shadowImage = shadowImage
    } else {
      let shadowImage = BEUIConfiguration.style.navigationBarStyle.navBarShadowImageOrNil
      navController.navigationBar.shadowImage = shadowImage
    }
    
    if controller.appearance.navigationBarTintColorOrNil != nil {
      let tintColor = controller.appearance.navigationBarTintColorOrNil
      navController.navigationBar.tintColor = tintColor
    } else {
      let tintColor = BEUIConfiguration.style.navigationBarStyle.navBarTintColorOrNil
      navController.navigationBar.tintColor = tintColor
    }
    
    if controller.appearance.titleViewTintColorOrNil != nil {
      let tintColor = controller.appearance.titleViewTintColorOrNil
      controller.titleView.tintColor = tintColor
    } else {
      let tintColor = BEUIConfiguration.style.navigationBarStyle.navBarTitleColorOrNil
      controller.titleView.tintColor = tintColor
    }
    
    if controller.appearance.titleViewFontOrNil != nil {
      let font = controller.appearance.titleViewFontOrNil
      controller.titleView.titleFont = font
    } else {
      let font = BEUIConfiguration.style.navigationBarStyle.navBarTitleFontOrNil
      controller.titleView.titleFont = font
    }
  }
}
