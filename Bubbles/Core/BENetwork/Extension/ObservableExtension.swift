
import Foundation
import RxSwift
import Alamofire
import Moya
import SwiftyJSON
import HandyJSON

public extension ObservableType where E == JSON {
  
  public func map<T>(to type: T.Type, forKeyPath: String?) -> Observable<T> where T: HandyJSON {
    return flatMap({ json -> Observable<T> in
      var validData = json
      if let key = forKeyPath,key.count > 0 {
        validData = json[key]
      }
      guard validData.type != .null && validData.type != .unknown else {
        return Observable.error(CoreError.validDataNull)
      }
      let model = type.deserialize(from: validData.rawString())
      guard model != nil else {
        return Observable.error(CoreError.jsonModel("json data transform to \(type) model failed."))
      }
      
      return Observable.just(model!)
    })
  }
  
  public func verification(_ checker: Checker?) -> Observable<E> {
    return flatMap({ json -> Observable<E> in
      guard let ck = checker else { return Observable.just(json) }
      if try ck.check(json) {
        return Observable.just(json)
      }
      return Observable.error(CoreError.checkFailed)
    })
  }
}

