//
//  SomeViewController.swift
//  Bubbles
//
//  Created by god on 2018/6/29.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit


class SomeViewController: BEUIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleView.title = "SomeViewController"
  }
  
  override func didInitialize() {
    super.didInitialize()
    
    appearance.titleViewTintColorOrNil = .green
  }
}
