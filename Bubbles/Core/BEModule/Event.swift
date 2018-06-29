
import UIKit
import UserNotifications

public struct EventName: RawRepresentable, Equatable, Hashable {
  public typealias RawValue = String
  public private(set) var rawValue: String
  
  public var hashValue: Int {
    return rawValue.hashValue
  }
  
  public init(_ rawValue: String) {
    self.rawValue = rawValue
  }
  
  public init(rawValue: String) {
    self.rawValue = rawValue
  }
  
  public static func ==(lhs: EventName, rhs: EventName) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }
}

public enum EventType {
  
  case setupEvent
  case tearDownEvent
  case splashEvent
  case quickActionEvent
  case willResignActiveEvent
  case didEnterBackgroundEvent
  case willEnterForegroundEvent
  case didBecomeActiveEvent
  case willTerminateEvent
  case unmountEvent
  case openURLEvent
  case didReceiveMemoryWarningEvent
  case didFailToRegisterForRemoteNotificationsEvent
  case didRegisterForRemoteNotificationsEvent
  case didReceiveRemoteNotificationEvent
  case didReceiveLocalNotificationEvent
  case willContinueUserActivityEvent
  case continueUserActivityEvent
  case didFailToContinueUserActivityEvent
  case didUpdateUserActivityEvent
  case didCustomEvent(name: EventName, object: Any?)
}

public typealias NotificationResultHandler = (UIBackgroundFetchResult) -> Void
public struct NotificationsItem {
  var notificationsError: Error?
  var deviceToken: Data?
  var userInfo: [AnyHashable: Any] = [:]
  var notificationResultHander: NotificationResultHandler?
  var localNotification: UILocalNotification?
}

public struct OpenURLItem {
  var openURL: URL?
  var sourceApplication: String = ""
  var options: [AnyHashable: Any] = [:]
}

typealias ShortcutItemCompletionHandler = (Bool) -> Void
public struct ShortcutItem {
  var shortcutItem: UIApplicationShortcutItem?
  var scompletionHandler: ShortcutItemCompletionHandler?
}

public typealias RestorationHandler = ([Any]?) -> Void
public struct UserActivityItem {
  var userActivityType: String = ""
  var userActivity: NSUserActivity?
  var userActivityError: Error?
  var restorationHandler: RestorationHandler?
}
