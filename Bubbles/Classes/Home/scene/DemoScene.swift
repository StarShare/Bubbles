//
//  DemoScene.swift
//  Bubbles
//
//  Created by god on 2018/8/27.
//  Copyright © 2018 God. All rights reserved.
//

import UIKit

class DemoScene: BEUIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let v1 = UIView.init(frame: CGRect.init(x: 20, y: 108, width: 100, height: 100))
    v1.backgroundColor = UIColor.red
    
    let v2 = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
    v2.backgroundColor = UIColor.yellow
    
    v1.addSubview(v2)
    view.addSubview(v1)
    
    v1.bounds = CGRect.init(x: -20, y: -20, width: 100, height: 100)
  }
}
