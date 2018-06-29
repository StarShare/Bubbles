
import Foundation
import UIKit

open class ModuleDelegate: UIResponder, UIApplicationDelegate {
  
  open func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    Context.shared.application = application
    Context.shared.launchOptions = launchOptions ?? [:]
    ModuleManager.shared.context = Context.shared
    
    ModuleManager.shared.doEvent(.setupEvent)
    DispatchQueue.main.async {
      ModuleManager.shared.doEvent(.splashEvent)
    }
    
    return true
  }
  
  open func applicationDidBecomeActive(_ application: UIApplication) {
    ModuleManager.shared.doEvent(.didBecomeActiveEvent)
  }
  
  open func applicationWillResignActive(_ application: UIApplication) {
    ModuleManager.shared.doEvent(.willResignActiveEvent)
  }
  
  open func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    ModuleManager.shared.context.openURLItem.openURL = url
    ModuleManager.shared.context.openURLItem.sourceApplication = sourceApplication ?? ""
    ModuleManager.shared.doEvent(.openURLEvent)
    return true
  }
  
  open func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any]) -> Bool {
    ModuleManager.shared.context.openURLItem.openURL = url
    ModuleManager.shared.context.openURLItem.options = options
    ModuleManager.shared.doEvent(.openURLEvent)
    return true
  }
  
  open func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
    ModuleManager.shared.doEvent(.didReceiveMemoryWarningEvent)
  }
  
  open func applicationWillTerminate(_ application: UIApplication) {
    ModuleManager.shared.doEvent(.willTerminateEvent)
  }
  
  open func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    ModuleManager.shared.context.notificationsItem.deviceToken = deviceToken
    ModuleManager.shared.doEvent(.didRegisterForRemoteNotificationsEvent)
  }
  
  open func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    ModuleManager.shared.context.notificationsItem.notificationsError = error
    ModuleManager.shared.doEvent(.didFailToRegisterForRemoteNotificationsEvent)
  }
  
  open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
    ModuleManager.shared.context.notificationsItem.userInfo = userInfo
    ModuleManager.shared.doEvent(.didReceiveRemoteNotificationEvent)
  }
  
  open func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
    ModuleManager.shared.context.notificationsItem.localNotification = notification
    ModuleManager.shared.doEvent(.didReceiveLocalNotificationEvent)
  }
  
  open func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    ModuleManager.shared.context.notificationsItem.userInfo = userInfo
    ModuleManager.shared.context.notificationsItem.notificationResultHander = completionHandler
    ModuleManager.shared.doEvent(.didReceiveRemoteNotificationEvent)
  }
  
  open func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
    ModuleManager.shared.context.touchShortcutItem.shortcutItem = shortcutItem
    ModuleManager.shared.context.touchShortcutItem.scompletionHandler = completionHandler
    ModuleManager.shared.doEvent(.quickActionEvent)
  }
  
  open func applicationDidEnterBackground(_ application: UIApplication) {
    ModuleManager.shared.doEvent(.didEnterBackgroundEvent)
  }
  
  open func applicationWillEnterForeground(_ application: UIApplication) {
    ModuleManager.shared.doEvent(.willEnterForegroundEvent)
  }
  
  open func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
    ModuleManager.shared.context.userActivityItem.userActivityType = userActivityType
    ModuleManager.shared.doEvent(.willContinueUserActivityEvent)
    return true
  }
  
  open func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
    ModuleManager.shared.context.userActivityItem.userActivity = userActivity
    ModuleManager.shared.context.userActivityItem.restorationHandler = restorationHandler
    ModuleManager.shared.doEvent(.continueUserActivityEvent)
    return true
  }
  
  open func application(_ application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: Error) {
    ModuleManager.shared.context.userActivityItem.userActivityType = userActivityType
    ModuleManager.shared.context.userActivityItem.userActivityError = error
    ModuleManager.shared.doEvent(.didFailToContinueUserActivityEvent)
  }
  
  open func application(_ application: UIApplication, didUpdate userActivity: NSUserActivity) {
    ModuleManager.shared.context.userActivityItem.userActivity = userActivity
    ModuleManager.shared.doEvent(.didUpdateUserActivityEvent)
  }
}

