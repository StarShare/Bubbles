
import UIKit

public protocol BEUINavigationBarTransition {
  
  /// The Enabled of NavigationBar show & hiden
  /// only shouldCustomizeNavigationBarTransitionIfHideable == true
  var preferredNavigationBarHidden: Bool { get set }
  
  /// The Enabled of NavigationBar show & hiden
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

internal extension BEUIViewController {
  
  /// The view add TransitionNavigationBarIfNeeded
  func addTransitionNavigationBarIfNeeded() {
    guard view.window != nil else { return }
    guard let originBar = navigationController?.navigationBar else { return }
    
    let customBar = _BEUITransitionNavigationBar()
    customBar.setBackgroundImage(originBar.backgroundImage(for: .default), for: .default)
    customBar.isTranslucent = originBar.isTranslucent
    customBar.barTintColor = originBar.barTintColor
    customBar.shadowImage = originBar.shadowImage
    customBar.tintColor = originBar.tintColor
    customBar.barStyle = originBar.barStyle
    
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
  class func replaceNavigationBarStyle(source: UINavigationBar,target: UINavigationBar) {
    target.setBackgroundImage(source.backgroundImage(for: .default), for: .default)
    target.isTranslucent = source.isTranslucent
    target.barTintColor = source.barTintColor
    target.shadowImage = source.shadowImage
    target.tintColor = source.tintColor
    target.barStyle = source.barStyle
  }
  
  /// The navigationController.navigationBar backgroundView hiden
  func hidenNavigationBarBackgroundView(_ hiden: Bool) {
    guard let navBar = navigationController?.navigationBar else { return }
    guard let backgroundView: UIView = navBar.value(forKey: "backgroundView") as? UIView else { return }
    backgroundView.isHidden = hiden
  }
  
  /// To resize TransitionNavigationBar Frame
  func resizeTransitionNavigationBarFrame() {
    guard view.window != nil else { return }
    guard let navBar = navigationController?.navigationBar else { return }
    guard let backgroundView: UIView = navBar.value(forKey: "backgroundView") as? UIView else { return }
    let rect = backgroundView.superview?.convert(backgroundView.frame, to: view) ?? .zero
    transitionNavigationBar?.frame = rect
  }  
}

fileprivate class _BEUITransitionNavigationBar: UINavigationBar {
  
  /// layout _BEUITransitionNavigationBar backgroundView.
  override func layoutSubviews() {
    super.layoutSubviews()
    guard let content: UIView = value(forKey: "backgroundView") as? UIView else { return }
    content.frame = bounds
  }
}
