
import Foundation

public struct ServiceName: RawRepresentable, Equatable, Hashable {
  
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
  
  public static func ==(lhs: ServiceName, rhs: ServiceName) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }
}

public protocol Service {
  
  static func shareInstance() -> AnyObject?
  static func singleton() -> Bool
  init()
}

public extension Service {
  
  static func shareInstance() -> AnyObject? {
    return nil
  }
  
  static func singleton() -> Bool {
    return false
  }
}
