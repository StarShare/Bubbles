
import Foundation

public class Config {
  public static let `default` = Config()
  public var baseURL: URL?
  public var publicParameters: [String:String]?
}
