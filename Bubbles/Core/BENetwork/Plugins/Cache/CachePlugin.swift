
import Foundation
import Moya
import Result
import SwiftyJSON
import HandyJSON

final class CachePlugin: PluginType {
  
  var bean: Bean
  init(_ bean: Bean) {
    self.bean = bean
  }
  
  func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
    if case let .success(response) = result {
      if let cachePolicy = bean.cachePolicy {
        if cachePolicy.enable == true {
          guard let key: String = cachePolicy.key else { return }
          let json = JSON(response.data)
          var resp = true
          if let ck = bean.checker {
            try! resp = ck.check(json)
          }
          if resp {
            try! CacheCore.shared.save(json, forKey: key)
          }
        }
      }
    }
  }
}
