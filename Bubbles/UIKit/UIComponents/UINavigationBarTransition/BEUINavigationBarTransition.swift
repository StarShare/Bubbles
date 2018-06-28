//
//  BEUINavigationBarTransition.swift
//  Bubbles
//
//  Created by god on 2018/6/27.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

public protocol BEUINavigationBarTransition {
  
  /// The Enabled of NavigationBar show & hiden
  /// only shouldCustomizeNavigationBarTransitionIfHideable == true
  var preferredNavigationBarHidden: Bool { get set }
  
  /// The Enabled of CustomizeNavigationBar show & hiden
  var shouldCustomizeNavigationBarTransitionIfHideable: Bool { get set }
  
  /// The Enabled of CustomizeNavigationBar WhenPushAppearing
  var shouldCustomNavigationBarTransitionWhenPushAppearing: Bool { get set }
  
  /// The Enabled of CustomizeNavigationBar WhenPushDisappearing
  var shouldCustomNavigationBarTransitionWhenPushDisappearing: Bool { get set }
  
  /// The Enabled of CustomizeNavigationBar WhenPopAppearing
  var shouldCustomNavigationBarTransitionWhenPopAppearing: Bool { get set }
  
  /// The Enabled of CustomizeNavigationBar WhenPopDisappearing
  var shouldCustomNavigationBarTransitionWhenPopDisappearing: Bool { get set }
  
  /// The color of ContainerView BackgroundColor WhenTransitioning
  var containerViewBackgroundColorWhenTransitioningOrNil: UIColor? { get set }
}

public extension BEUIViewController {
  
  /// The view add TransitionNavigationBarIfNeeded
  func addTransitionNavigationBarIfNeeded() {
    guard view.window != nil else { return }
    guard let originBar = navigationController?.navigationBar else { return }
    
    let customBar = _BEUITransitionNavigationBar()
    if customBar.barStyle != originBar.barStyle {
      customBar.barStyle = originBar.barStyle
    }
    if customBar.isTranslucent != originBar.isTranslucent {
      customBar.isTranslucent = originBar.isTranslucent
    }
    if let barTintColor = customBar.barTintColor {
      if barTintColor.isEqual(originBar.barTintColor) == false {
        customBar.barTintColor = originBar.barTintColor;
      }
    } else if let barTintColor = originBar.barTintColor {
      if barTintColor.isEqual(customBar.barTintColor) == false {
        customBar.barTintColor = originBar.barTintColor;
      }
    }
    customBar.setBackgroundImage(originBar.backgroundImage(for: .default), for: .default)
    customBar.shadowImage = originBar.shadowImage
    
    transitionNavigationBar = customBar
    resizeTransitionNavigationBarFrame()
    
    if navigationController?.isNavigationBarHidden == false {
      view.addSubview(transitionNavigationBar!)
    }
  }
  
  /// The view remove TransitionNavigationBarIfNeeded
  func removeTransitionNavigationBarIfNeeded() {
    guard let navBar = transitionNavigationBar else { return }
    navBar.removeFromSuperview()
    transitionNavigationBar = nil
  }
  
  /// Replace NavigationBar Style
  class func replaceNavigationBarStyle(one: UINavigationBar,other: UINavigationBar) {
    other.barStyle = one.barStyle
    other.barTintColor = one.barTintColor
    other.setBackgroundImage(one.backgroundImage(for: .default), for: .default)
    other.shadowImage = one.shadowImage
  }
  
  /// The navigationController.navigationBar backgroundView hiden
  func hidenNavigationBarBackgroundView(_ hiden: Bool) {
    guard let backgroundView: UIView =
      navigationController?.navigationBar.value(forKey: "backgroundView")
        as?
      UIView else {
      return
    }
    backgroundView.alpha = hiden ? 0 : 1
  }
  
  /// To resize TransitionNavigationBar Frame
  func resizeTransitionNavigationBarFrame() {
    guard view.window != nil else { return }
    guard let backgroundView: UIView =
      navigationController?.navigationBar.value(forKey: "backgroundView")
        as?
      UIView else {
        return
    }
    let rect = backgroundView.superview?.convert(backgroundView.frame, to: view) ?? .zero
    transitionNavigationBar?.frame = rect
  }  
}

fileprivate class _BEUITransitionNavigationBar: UINavigationBar {
  
  override func layoutSubviews() {
    super.layoutSubviews()
    guard let backgroundView: UIView = value(forKey: "backgroundView")
        as?
      UIView else {
        return
    }
    backgroundView.frame = bounds
  }
}
