//
//  NSObject.swift
//  Bubbles
//
//  Created by god on 2018/8/25.
//  Copyright © 2018 God. All rights reserved.
//

import Foundation

public extension NSObject {
  
  @discardableResult
  static func swizzleMethod(_ cls: AnyClass, originalSelector: Selector, swizzleSelector: Selector) -> Bool {
    let oriMethod = class_getInstanceMethod(cls, originalSelector)
    let newMethod = class_getInstanceMethod(cls, swizzleSelector)
    if oriMethod == nil, newMethod == nil {
      return false
    }
    let didAddMethod = class_addMethod(cls,
                                       originalSelector,
                                       method_getImplementation(newMethod!),
                                       method_getTypeEncoding(newMethod!))
    if didAddMethod {
      class_replaceMethod(cls,
                          swizzleSelector,
                          method_getImplementation(oriMethod!),
                          method_getTypeEncoding(oriMethod!))
    } else {
      method_exchangeImplementations(oriMethod!, newMethod!)
    }
    
    return true
  }
}
