//
//  DetailViewController.swift
//  Bubbles
//
//  Created by god on 2018/6/28.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

public extension UIImage {
  convenience init?(color: UIColor, size: CGSize = CGSize(width: 10, height: 10)) {
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
    
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    
    self.init(cgImage:(UIGraphicsGetImageFromCurrentImageContext()?.cgImage!)!)
    UIGraphicsEndImageContext()
  }
}

class DetailViewController: BEUIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleView.title = "DetailViewController -> viewDidLoad() -> titleView.title(23333~)"
    
    
    let tap = UITapGestureRecognizer.init(target: self, action: #selector(some))
    view.addGestureRecognizer(tap)
  }
  
  override func didInitialize() {
    super.didInitialize()
    
    appearance.shouldSetStatusBarStyleLight = true
    appearance.titleViewFontOrNil = UIFont.boldSystemFont(ofSize: 20)
    appearance.titleViewTintColorOrNil = .red
    appearance.navigationBarBackgroundImageOrNil = UIImage.init(color: .brown)

    transition.shouldCustomNavigationBarTransitionWhenPushAppearing = true
    transition.shouldCustomNavigationBarTransitionWhenPopAppearing = true
    transition.shouldCustomNavigationBarTransitionWhenPushDisappearing = true
    transition.shouldCustomNavigationBarTransitionWhenPopDisappearing = true
    
    supportedOrientationMask = .landscapeLeft
  }
  
  @objc func some() {
    let some = SomeViewController()
    navigationController?.pushViewController(some, animated: true)
  }
}
