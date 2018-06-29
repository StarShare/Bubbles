
import Foundation

public class ModuleManager {
  
  public static let shared = ModuleManager()
  private var modules: [String:Module] = [:]
  private var moduleClasses: [String:String] = [:]
  private let _onceToken = NSUUID().uuidString
  public var context: Context {
    didSet {
      DispatchQueue.once(token: _onceToken) {
      }
    }
  }
  
  init() {
    self.context = Context.shared
  }
  
  public func doEvent(_ eventType: EventType) {
    switch eventType {
    case .setupEvent: handleModulesSetupEvent()
    case .tearDownEvent: handleModulesTearDownEvent()
    case let .didCustomEvent(name,object): handleModulesCustomEvent(name: name, object: object)
    default: handleModuleEvent(eventType)
    }
  }
  
  func handleModulesSetupEvent() {
    for instance in modules.map({ (key, value) -> Module in
      value
    }).filter({ $0.getEnable() == true }) {
      let bk: () -> Void = {
        instance.modSetUp(Context.shared)
      }
      if instance.async() {
        DispatchQueue.main.async {
          bk()
        }
      } else {
        bk()
      }
    }
  }
  
  func handleModulesTearDownEvent() {
    for instance in modules.map({ (key, value) -> Module in
      value
    }).filter({ $0.getEnable() == true }) {
      instance.modTearDown(Context.shared)
    }
  }
  
  func handleModulesCustomEvent(name: EventName, object: Any?) {
    for instance in modules.map({ (key, value) -> Module in
      value
    }).filter({ $0.getEnable() == true && $0.getCustomEvents().contains(name) }) {
      instance.modDidCustomEvent(Context.shared, name: name, object: object)
    }
  }
  
  func handleModuleEvent(_ eventType: EventType) {
    for instance in modules.map({ (key, value) -> Module in
      value
    }).filter({ $0.getEnable() == true }) {
      switch eventType {
      case .splashEvent: instance.modSplash(Context.shared)
      case .willResignActiveEvent: instance.modWillResignActive(Context.shared)
      case .didEnterBackgroundEvent: instance.modDidEnterBackground(Context.shared)
      case .willEnterForegroundEvent: instance.modWillEnterForeground(Context.shared)
      case .didBecomeActiveEvent: instance.modDidBecomeActive(Context.shared)
      case .willTerminateEvent: instance.modWillTerminate(Context.shared)
      case .unmountEvent: instance.modUnmount(Context.shared)
      case .openURLEvent: instance.modOpenURL(Context.shared)
      case .didReceiveMemoryWarningEvent: instance.modDidReceiveMemoryWaring(Context.shared)
      case .didReceiveRemoteNotificationEvent: instance.modDidReceiveRemoteNotification(Context.shared)
      case .didFailToRegisterForRemoteNotificationsEvent: instance.modDidFailToRegister(forRemoteNotifications: Context.shared)
      case .didRegisterForRemoteNotificationsEvent: instance.modDidRegister(forRemoteNotifications: Context.shared)
      case .didReceiveLocalNotificationEvent: instance.modDidReceiveLocalNotification(Context.shared)
      case .willContinueUserActivityEvent: instance.modWillContinueUserActivity(Context.shared)
      case .continueUserActivityEvent: instance.modContinueUserActivity(Context.shared)
      case .didFailToContinueUserActivityEvent: instance.modDidFail(toContinueUserActivity: Context.shared)
      case .didUpdateUserActivityEvent: instance.modDidUpdateContinueUserActivity(Context.shared)
      case .quickActionEvent: instance.modQuickAction(Context.shared)
      default:
        break
      }
    }
  }
  
  public func find(_ name: String) -> Module? {
    return modules[name]
  }
  
  public func find(_ type: Module.Type) -> Module? {
    let className = "\(type)"
    let name = moduleClasses.filter({ (key,value) -> Bool in
      return value == className
    }).map { (key,value) -> String in
      return key
    }.first
    if name == nil {
      return nil
    }
    
    return modules[name!]
  }
  
  public func getModules() -> [Module] {
    return modules.map({ (key,value) -> Module in
      return value
    })
  }
  
  @discardableResult
  public func register(_ module: Module) -> Module? {
    let oldModule = find(module.getName())
    if oldModule != nil {
      remove(oldModule!.getName())
    }
    
    if let className = "\(type(of: module))".components(separatedBy: ".").last {
      moduleClasses[module.getName()] = className
    }
    modules[module.getName()] = module
    
    titan_log(
      "register mod:\(module.getName()) -> \(module.getVersion())",
      identifier: "ModuleManager"
    )
    return oldModule
  }
  
  @discardableResult
  public func remove(_ name: String) -> Module? {
    let oldModule = find(name)
    if oldModule != nil {
      oldModule!.destroy()
      modules.removeValue(forKey: name)
      moduleClasses.removeValue(forKey: name)
      titan_log(
        "remove mod:\(oldModule!.getName()) -> \(oldModule!.getVersion())",
        identifier: "ModuleManager"
      )
    }
    
    return oldModule
  }
  
  public func destroy() {
    modules.forEach { (key,module) in
      module.destroy()
    }
    modules.removeAll()
    moduleClasses.removeAll()
    
    titan_log(
      "destroy all mod",
      identifier: "ModuleManager"
    )
  }
}

fileprivate extension DispatchQueue {
  
  private static var _onceTracker = [String]()
  class func once(token: String, block: ()->Void) {
    objc_sync_enter(self);
    defer { objc_sync_exit(self) }
    
    if _onceTracker.contains(token) {
      return
    }
    
    _onceTracker.append(token)
    block()
  }
}
