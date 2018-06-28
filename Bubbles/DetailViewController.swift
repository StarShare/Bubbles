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
    
    appearance.shouldSetStatusBarStyleLight = false
    appearance.navigationBarShadowImageOrNil = UIImage()
    appearance.navigationBarBackgroundImageOrNil = UIImage.init(color: .red)
    
    transition.shouldCustomNavigationBarTransitionWhenPopAppearing = true
    transition.shouldCustomNavigationBarTransitionWhenPopDisappearing = true
    transition.shouldCustomNavigationBarTransitionWhenPushAppearing = true
    transition.shouldCustomNavigationBarTransitionWhenPushDisappearing = true
  }
}
