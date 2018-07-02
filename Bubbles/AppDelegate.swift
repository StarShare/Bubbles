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
    
    BEUIConfiguration.style.navigationBarStyle = UINavigationBarStyle()
    BEUIConfiguration.style.tabBarStyle = UITabBarStyle()
    BEUIConfiguration.style.otherStyle = UIOtherStyle()
    BEUIConfiguration.style.tableStyle = UITableStyle()
    
    let chats = BEUINavigationController.init(rootViewController: ChatsScene())
    chats.tabBarItem.title = "Bubbles"
    chats.tabBarItem.image = UIImage(named: "tabbar_chats")
    
    let contacts = BEUINavigationController.init(rootViewController: ContactsScene())
    contacts.tabBarItem.title = "通讯录"
    contacts.tabBarItem.image = UIImage(named: "tabbar_contacts")
    
    let discover = BEUINavigationController.init(rootViewController: DiscoverScene())
    discover.tabBarItem.title = "发现"
    discover.tabBarItem.image = UIImage(named: "tabbar_discover")
    
    let mine = BEUINavigationController.init(rootViewController: MineScene())
    mine.tabBarItem.title = "我的"
    mine.tabBarItem.image = UIImage(named: "tabbar_mine")
    
    let tab = BEUITabBarController()
    tab.setViewControllers([chats,contacts,discover,mine], animated: false)
    window = UIWindow.init(frame: UIScreen.main.bounds)
    window?.rootViewController = tab
    window?.makeKeyAndVisible()
    
    let table = BEUITableViewController()
    table.tableView.backgroundView = UIView()
    
    return true
  }
}

