
import Foundation
import Moya
import SwiftyJSON
import HandyJSON

public protocol Bean {
  
  /// The target's base `URL`,default use Core.configuration().baseURL
  var baseURL: URL { get }
  
  /// The path to be appended to `baseURL` to form the full `URL`.
  var path: String { get }
  
  /// The HTTP method used in the request.
  var method: HTTPMethod { get }
  
  /// The type of HTTP task to be performed.
  var task: HTTPTask { get }
  
  /// The headers to be used in the request.
  var headers: [String: String]? { get }
  
  /// The parameters to be used in every request.
  var publicParameters: [String: String]? { get }
  
  /// The response check to perform on the request.
  var checker: Checker? { get }
  
  /// The cache policy of the request's response.
  var cachePolicy: CachePolicy? { get }
}

public extension Bean {
  
  func asMoyaTarget() -> MoyaTarget {
    return MoyaTarget(self)
  }
}

public struct MoyaTarget: TargetType {
  
  public var baseURL: URL {
    return bean.baseURL
  }
  
  public var path: String {
    return bean.path
  }
  
  public var method: Moya.Method {
    return bean.method
  }
  
  public var sampleData: Data {
    return "Core".data(using: String.Encoding.utf8)!
  }
  
  public var task: Task {
    return bean.task.mapping(with: bean)
  }
  
  public var validationType: ValidationType {
    return .successCodes
  }
  
  public var headers: [String: String]? {
    return bean.headers
  }
  
  private var bean: Bean
  init(_ bean: Bean) {
    self.bean = bean
  }
}
