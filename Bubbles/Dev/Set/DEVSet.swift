//
//  DEVSet.swift
//  Bubbles
//
//  Created by god on 2018/8/17.
//  Copyright © 2018年 God. All rights reserved.
//

import Foundation

class DEVSet {
  
  func test() {
    var primeNums: Set = ["3","5","7","11","13"]
    let oddNums: Set = ["1","3","5","7","9"]
    
    let primeAndOddNum = primeNums.intersection(oddNums)
    print(primeAndOddNum)
    let oddNotPrimNum = primeNums.subtracting(oddNums)
    print(oddNotPrimNum)
    primeNums.formUnion(oddNums)
    print(primeNums)
    
    /// 2Sum
    print(twoSumb(nums: [1,3,5,7,9], 8))
    print(twoSuma(nums: [1,3,5,7,9], 8))
  }
  
  func twoSumb(nums: [Int], _ target: Int) -> Bool {
    var set = Set<Int>()
    
    for num in nums {
      if set.contains(target - num) {
        return true
      }
      
      set.insert(num)
    }
    
    return false
  }
  
  func twoSuma(nums: [Int], _ target: Int) -> [Int] {
    var dic = [Int:Int]()
    
    for (i,num) in nums.enumerated() {
      if let lastIndex = dic[target - num] {
        return [lastIndex,i]
      } else {
        dic[num] = i
      }
    }
    
    fatalError("No valid output!")
  }
}
