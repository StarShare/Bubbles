//
//  LinkedMap.swift
//  Bubbles
//
//  Created by god on 2018/8/20.
//  Copyright © 2018年 God. All rights reserved.
//

import Foundation

class DEVLinkedMap {
  
  func test() {
    
  }
  
  func returnMinNodes(_ map: LinkedMap, num: Int) {
    let min = LinkedMap()
    var nod = map.head
    
    while nod != nil {
      if nod!.value < num {
        min.appendToTail(nod!.value)
      }
      nod = nod!.next
    }
  }
  
  func hasCycle(_ head: LinkedMapNode?) -> Bool {
    var slow = head
    var fast = head
    
    while fast != nil && fast!.next != nil {
      slow = slow!.next
      fast = fast!.next!.next
    }
    
    /**
     “等价于===”表示两个类类型（class type）的常量或者变量引用同一个类实例。
     “等于==”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
     */
    if slow === fast {
      return true
    }
    
    return false
  }
}

class LinkedMapNode {
  var value: Int
  var next: LinkedMapNode?
  
  init(_ value: Int) {
    self.value = value
    self.next = nil
  }
}

class LinkedMap {
  var head: LinkedMapNode?
  var tail: LinkedMapNode?
  
  func appendToHead(_ val: Int) {
    if head == nil {
      head = LinkedMapNode(val)
      tail = head
    } else {
      let temp = LinkedMapNode(val)
      temp.next = head
      head = temp
    }
  }
  
  func appendToTail(_ val: Int) {
    if tail == nil {
      tail = LinkedMapNode(val)
      head = tail
    } else {
      let temp = LinkedMapNode(val)
      tail!.next = temp
      tail = temp
    }
  }
}
