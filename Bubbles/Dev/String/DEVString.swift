//
//  DEVString.swift
//  Bubbles
//
//  Created by god on 2018/8/17.
//  Copyright © 2018年 God. All rights reserved.
//

import Foundation

class DEVString {
  
  func test() {
    let string: String = "hello word"
    var chars = string.components(separatedBy: " ")
    reverse(&chars, 0, chars.count - 1)
    print(chars.joined(separator: " "))
  }
  
  fileprivate func reverse(_ chars: inout [String], _ start: Int, _ end: Int) {
    var start = start, end = end
    
    while start < end {
      swapchar(&chars, start, end)
      start += 1
      end -= 1
    }
  }
  
  fileprivate func swapchar(_ chars: inout [String], _ p: Int, _ q: Int) {
    (chars[p],chars[q]) = (chars[q],chars[p])
  }
}
