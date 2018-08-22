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
    Context.shared.env = .dev
    Context.shared.application = application
    Context.shared.launchOptions = launchOptions
    _ = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    BEUIConfiguration.style.navigationBarStyle = UINavigationBarStyle()
    BEUIConfiguration.style.tabBarStyle = UITabBarStyle()
    BEUIConfiguration.style.otherStyle = UIOtherStyle()
    BEUIConfiguration.style.tableStyle = UITableStyle()
    
    let home = BEUINavigationController.init(rootViewController: HomeScene())
    window = UIWindow.init(frame: UIScreen.main.bounds)
    window?.rootViewController = home
    window?.makeKeyAndVisible()
    
    return true
  }
}

