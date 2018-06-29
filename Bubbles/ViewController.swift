//
//  ViewController.swift
//  Bubbles
//
//  Created by god on 2018/6/26.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

class ViewController: BEUIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleView.title = "ViewController"
    
    let tap = UITapGestureRecognizer.init(target: self, action: #selector(detail))
    view.addGestureRecognizer(tap)
  }
  
  override func didInitialize() {
    super.didInitialize()
    
    appearance.titleViewTintColorOrNil = .blue
  }
  
  @objc func detail() {
    let detail = DetailViewController()
    navigationController?.pushViewController(detail, animated: true)
  }
}

