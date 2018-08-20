//
//  DEVArray.swift
//  Bubbles
//
//  Created by god on 2018/8/17.
//  Copyright © 2018年 God. All rights reserved.
//

import Foundation

/// 数组模拟栈
class Stack {
  var stack: [AnyObject]
  var isEmpty: Bool {
    return stack.isEmpty
  }
  var peek: AnyObject? {
    return stack.last
  }
  
  init() {
    stack = [AnyObject]()
  }
  
  func push(object: AnyObject) {
    stack.append(object)
  }
  
  func pop() -> AnyObject? {
    if !isEmpty {
      return stack.removeLast()
    } else {
      return nil
    }
  }
}

class DEVArray {
  
  func test() {
    let array1 = [1,2,3]
    let array2 = [Int](repeating: 0, count: 5)
    var nums = [3,2,1]
    nums.reserveCapacity(4)
    nums.append(0)
    nums.sort()
    nums.sort(by: <)
    let anotherNums = Array(nums[0 ..< nums.count - 1])
    nums.removeAll()
    nums.reserveCapacity(0)
    
    print(array1,array2,nums,anotherNums)
    
    let stack = Stack()
    stack.push(object: "张三" as AnyObject)
    stack.push(object: "李四" as AnyObject)
    stack.push(object: "王五" as AnyObject)
    print(stack.stack)
    print(stack.peek ?? "peek nil")
    print(stack.pop() ?? "pop nil")
    print(stack.stack)
    
    /// 效率最高。元素分配在连续的元素上。如果数组是值类型（栈上操作），则 Swift 会调用 Array 的这种实现；
    /// 如果注重效率，那么推荐声明这种类型，尤其是在大量元素是类时，这样做效果会很好。
    let contiguos = ContiguousArray<Int>()
    print(contiguos)
    /// 会自动桥接到 Objective-C 中的 NSArray 上，如果是值类型，则其性能和 ContiguousArray 无差别。
    let normallarr = Array<Int>()
    print(normallarr)
    /// 它不是一个新的数组，只是一个片段，在内存上与原数组享用同一片区域。
    let slice = ArraySlice<Int>()
    print(slice)
  }
}
