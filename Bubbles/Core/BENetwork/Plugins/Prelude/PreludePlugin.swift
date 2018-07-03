
import Foundation
import Moya
import Result
import SwiftyJSON
import HandyJSON

final class PreludePlugin: PluginType {
  
  /// The plugin shared instance.
  static let shared = PreludePlugin()
  
  func willSend(_ request: RequestType, target: TargetType) {
    
  }
}
