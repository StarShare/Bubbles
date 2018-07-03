
import Foundation
import Cache
import HandyJSON
import SwiftyJSON

public protocol CacheAware {
  
  func save(_ object: JSON, forKey key: String) throws
  func save(_ object: JSON, forBean bean: Bean) throws
  func fetch<T: HandyJSON>(ofType type: T.Type, forKey key: String) throws -> T?
  func fetch<T: HandyJSON>(ofType type: T.Type, forBean bean: Bean) throws -> T?
  func remove(forKey key: String) throws
  func remove(forBean bean: Bean) throws
  func removeAll() throws
}

public class CacheCore: CacheAware {
  
  static let shared = CacheCore(try! Storage(
    diskConfig: DiskConfig(
      name: "share-response-cache",
      expiry: .never,
      maxSize: 10000,
      directory: try! FileManager.default.url(for: .documentDirectory,
                                              in: .userDomainMask,
                                              appropriateFor: nil,
                                              create: true).appendingPathComponent("CoreCache"),
      protectionType: .complete
    ), memoryConfig: MemoryConfig(
      expiry: .never,
      countLimit: 50,
      totalCostLimit: 0
  ), transformer:TransformerFactory.forData()))
  
  fileprivate var currentStorage: Storage<Data>
  init(_ storage: Storage<Data>) {
    currentStorage = storage
  }
  
  /// MARK: - CacheAware
  
  public func save(_ object: JSON,forKey key: String) throws {
    if let data = object.rawString()?.data(using: String.Encoding.utf8) {
      try self.currentStorage.setObject(data, forKey: key)
    }
  }
  
  public func save(_ object: JSON,forBean bean: Bean) throws {
    if let cachePolicy = bean.cachePolicy {
      if cachePolicy.enable == true {
        guard let key = cachePolicy.key else { return }
        try self.save(object, forKey: key)
      }
    }
  }
  
  public func fetch<T: HandyJSON>(ofType type: T.Type, forKey key: String) throws -> T? {
    let data = try self.currentStorage.entry(forKey: key).object
    let json = try JSON.init(data: data)
    return type.deserialize(from: json.rawString())
  }
  
  public func fetch<T: HandyJSON>(ofType type: T.Type, forBean bean: Bean) throws -> T? {
    if let cachePolicy = bean.cachePolicy {
      if cachePolicy.enable == true {
        guard let key = cachePolicy.key else { return nil }
        return try self.fetch(ofType: type, forKey: key)
      }
    }
    return nil
  }
  
  public func remove(forKey key: String) throws {
    try self.currentStorage.removeObject(forKey: key)
  }
  
  public func remove(forBean bean: Bean) throws {
    if let cachePolicy = bean.cachePolicy {
      if cachePolicy.enable == true {
        guard let key = cachePolicy.key else { return }
        try self.remove(forKey: key)
      }
    }
  }
  
  public func removeAll() throws {
    try self.currentStorage.removeAll()
  }
}
