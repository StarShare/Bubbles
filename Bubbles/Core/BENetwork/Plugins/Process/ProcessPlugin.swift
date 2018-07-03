
import Foundation
import Moya
import Result
import SwiftyJSON
import HandyJSON

final class ProcessPlugin: PluginType {
  
  /// The plugin shared instance.
  static let shared = ProcessPlugin()
  
  func process(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
    return result
  }
}
