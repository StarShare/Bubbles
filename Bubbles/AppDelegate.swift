//
//  AppDelegate.swift
//  Bubbles
//
//  Created by god on 2018/6/26.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: ModuleDelegate {

  var window: UIWindow?

  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    /// BEModule setup.
    Context.shared.env = .dev
    _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    
    let nav = BEUINavigationController.init(rootViewController: ViewController())
    window = UIWindow.init(frame: UIScreen.main.bounds)
    window?.rootViewController = nav
    window?.makeKeyAndVisible()
    
    return true
  }
}

