
import Foundation

public protocol Module {
  
  init(_ config: ModuleConfig)
  func async() -> Bool
  func modSetUp(_ context: Context)
  func modSplash(_ context: Context)
  func modQuickAction(_ context: Context)
  func modTearDown(_ context: Context)
  func modWillResignActive(_ context: Context)
  func modDidEnterBackground(_ context: Context)
  func modWillEnterForeground(_ context: Context)
  func modDidBecomeActive(_ context: Context)
  func modWillTerminate(_ context: Context)
  func modUnmount(_ context: Context)
  func modOpenURL(_ context: Context)
  func modDidReceiveMemoryWaring(_ context: Context)
  func modDidFailToRegister(forRemoteNotifications context: Context)
  func modDidRegister(forRemoteNotifications context: Context)
  func modDidReceiveRemoteNotification(_ context: Context)
  func modDidReceiveLocalNotification(_ context: Context)
  func modWillContinueUserActivity(_ context: Context)
  func modContinueUserActivity(_ context: Context)
  func modDidFail(toContinueUserActivity context: Context)
  func modDidUpdateContinueUserActivity(_ context: Context)
  func modDidCustomEvent(_ context: Context, name: EventName, object: Any?)
  
  func getEnable() -> Bool
  func getName() -> String
  func getVersion() -> String
  func getCreation() -> Date
  func registerServices()
  func getSercvices() -> [ServiceName:AnyClass]
  func getCustomEvents() -> [EventName]
  func destroy()
  func description() -> String
}

public extension Module {
  
  func async() -> Bool { return false }
  func modSetUp(_ context: Context) {}
  func modSplash(_ context: Context) {}
  func modQuickAction(_ context: Context) {}
  func modTearDown(_ context: Context) {}
  func modWillResignActive(_ context: Context) {}
  func modDidEnterBackground(_ context: Context) {}
  func modWillEnterForeground(_ context: Context) {}
  func modDidBecomeActive(_ context: Context) {}
  func modWillTerminate(_ context: Context) {}
  func modUnmount(_ context: Context) {}
  func modOpenURL(_ context: Context) {}
  func modDidReceiveMemoryWaring(_ context: Context) {}
  func modDidFailToRegister(forRemoteNotifications context: Context) {}
  func modDidRegister(forRemoteNotifications context: Context) {}
  func modDidReceiveRemoteNotification(_ context: Context) {}
  func modDidReceiveLocalNotification(_ context: Context) {}
  func modWillContinueUserActivity(_ context: Context) {}
  func modContinueUserActivity(_ context: Context) {}
  func modDidFail(toContinueUserActivity context: Context) {}
  func modDidUpdateContinueUserActivity(_ context: Context) {}
  func modDidCustomEvent(_ context: Context, name: EventName, object: Any?) {}
}

public extension Module {
  
  func description() -> String {
    let customEvents = getCustomEvents().map { $0.rawValue }
    return "Module Description: " +
           "<name:\(getName())>" +
           "<version:\(getVersion())>" +
           "<creation:\(getCreation())>" +
           "<enable:\(getEnable() ? "true" : "false")>" +
           "<customEvents:\(customEvents)>"
  }
}

public extension Module {
  
  func registerServices() {
    let services = getSercvices()
    services.forEach { (name,cls) in
      ServiceManager.shared.register(service: name, implClass: cls)
    }
  }
}
