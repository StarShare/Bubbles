
import Foundation
import Moya

final class PreparePlugin: PluginType {
  
  /// The plugin shared instance.
  static let shared = PreparePlugin()
  
  func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    var request = request
    request.timeoutInterval = 60
    return request
  }
}
