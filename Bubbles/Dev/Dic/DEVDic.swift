//
//  DEVDic.swift
//  Bubbles
//
//  Created by god on 2018/8/20.
//  Copyright © 2018年 God. All rights reserved.
//

import Foundation

class DEVDic {
  
  func test() {
    print(Dictionary.init("hello".map{($0,1)}, uniquingKeysWith: +))
  }
}
