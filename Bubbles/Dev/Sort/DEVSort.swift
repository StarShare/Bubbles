//
//  DEVSort.swift
//  Bubbles
//
//  Created by god on 2018/8/20.
//  Copyright © 2018年 God. All rights reserved.
//

import Foundation

class DEVSort {
  
  /// 冒泡排序
  func bubbleSort(_ nums: inout [Int]) {
    for i in (0..<nums.count) {
      for j in (i..<nums.count - 1) {
        if nums[j] > nums[j+1] {
          (nums[j],nums[j+1]) = (nums[j+1],nums[j])
        }
      }
    }
  }
  
  /// 插入排序
  func insertSort(_ nums: inout [Int]) {
    
  }
  
  func or(left: Bool, right: @autoclosure () -> Bool) -> Bool {
    if left {
      return true
    } else {
      return right()
    }
  }
}

protocol Pet {
  var name: String { get set }
}

struct MyDog: Pet {
  var name: String
  
  mutating
  func changeName(name: String) {
    self.name = name
  }
}
