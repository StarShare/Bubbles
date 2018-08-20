//
//  DEVTree.swift
//  Bubbles
//
//  Created by god on 2018/8/20.
//  Copyright © 2018年 God. All rights reserved.
//

import Foundation

class DEVTree {
  
  /// 计算树的最大深度
  func maxDepth(_ node: TreeNode?) -> Int {
    guard let node = node else {
      return 0
    }
    return max(maxDepth(node.left), maxDepth(node.right)) + 1
  }
  
  /// 判断一棵树是否为二叉查找树
  func isValidBST(node: TreeNode?, min: Int?, max: Int?) -> Bool {
    guard let node = node else {
      return true
    }
    
    if let min = min, node.value <= min {
      return false
    }
    
    if let max = max, node.value >= max {
      return false
    }
    
    return
      isValidBST(node: node.left, min: min, max: node.value) &&
      isValidBST(node: node.right, min: node.value, max: max)
  }
}

class TreeNode {
  var value: Int
  var left : TreeNode?
  var right: TreeNode?
  
  init(_ value: Int) {
    self.value = value
    self.left  = nil
    self.right = nil
  }
}
