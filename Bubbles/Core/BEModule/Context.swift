
import UIKit

public enum EnvironmentType {
  case dev
  case test
  case prod
}

public class Context {
  
  public static let shared = Context()
  public var env = EnvironmentType.prod
  public var application: UIApplication!
  public var launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  public var touchShortcutItem = ShortcutItem()
  public var openURLItem = OpenURLItem()
  public var notificationsItem = NotificationsItem()
  public var userActivityItem = UserActivityItem()
  
  init() {}
}
