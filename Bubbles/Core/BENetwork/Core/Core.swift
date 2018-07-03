
import Alamofire
import Foundation
import Moya
import HandyJSON
import SwiftyJSON
import RxSwift

public typealias HTTPMethod  = Moya.Method
public typealias HTTPTask    = Moya.Task

public protocol Core {
  
  /// The net core configuration.
  ///
  /// - Returns: config
  func configuration() -> Config
  
  /// Read cache data form disk&memory with Bean.
  ///
  /// - Parameters:
  ///   - bean: Parameters that contain network requests
  ///   - type: type of response shoud be transform
  /// - Returns: Observable with RxSwift
  func loadCacheIfNeed<T>(with bean: Bean, to type: T.Type) -> Observable<T> where T: HandyJSON
  
  /// Remove cache data form disk&memory with Bean.
  ///
  /// - Parameter: bean: Parameters that contain network requests
  /// - Returns: Observable with RxSwift
  func removeCacheIfNeed(with bean: Bean) -> Observable<Bool>
  
  /// Send data request with Bean use ‘Alamofire’ 、‘RxSwift’.
  ///
  /// - Parameters:
  ///   - bean: Parameters that contain network requests
  ///   - type: type of response shoud be transform
  /// - Returns: Observable with RxSwift
  func request<T>(with bean: Bean, to type: T.Type) -> Observable<T> where T: HandyJSON
  
  /// Send upload request with Bean use ‘Alamofire’ 、‘RxSwift’.
  ///
  /// - Parameter bean: Parameters that contain network requests
  /// - Returns: Observable with RxSwift
  func upload(with bean: Bean) -> Observable<ProgressResponse>
  
  /// Send download request with Bean use ‘Alamofire’ 、‘RxSwift’.
  ///
  /// - Parameter bean: Parameters that contain network requests
  /// - Returns: Observable with RxSwift
  func download(with bean: Bean) -> Observable<ProgressResponse>
}

public extension Core {
  
  func configuration() -> Config {
    return Config.default
  }
  
  func readCacheIfNeed<T>(with bean: Bean, to type: T.Type) -> Observable<T> where T: HandyJSON {
    return Observable.create({ observer -> Disposable in
      let cache = try? CacheCore.shared.fetch(ofType: type, forBean: bean)
      if let cache = cache {
        observer.onNext(cache!)
        observer.onCompleted()
      } else {
        observer.onError(CoreError.noneCache)
      }
      
      return Disposables.create()
    })
  }
  
  func removeCacheIfNeed(with bean: Bean) -> Observable<Bool> {
    return Observable.create({ observer -> Disposable in
      do {
        try CacheCore.shared.remove(forBean: bean)
        observer.onNext(true)
        observer.onCompleted()
      } catch {
        observer.onNext(false)
        observer.onCompleted()
      }
      
      return Disposables.create()
    })
  }
  
  func request<T>(with bean: Bean, to type: T.Type) -> Observable<T> where T: HandyJSON {
    return MoyaProvider<MoyaTarget>(plugins: [PreludePlugin.shared,
                                              PreparePlugin.shared,
                                              LogPlugin.shared,
                                              CachePlugin(bean),
                                              ProcessPlugin.shared])
      .rx
      .request(bean.asMoyaTarget())
      .verification(bean.checker)
      .map(to: type, forKeyPath: "data")
  }
  
  func upload(with bean: Bean) -> Observable<ProgressResponse> {
    return MoyaProvider<MoyaTarget>(plugins: [PreludePlugin.shared,
                                              PreparePlugin.shared,
                                              LogPlugin.shared,
                                              ProcessPlugin.shared])
      .rx
      .progressRequest(bean.asMoyaTarget())
  }
  
  func download(with bean: Bean) -> Observable<ProgressResponse> {
    return MoyaProvider<MoyaTarget>(plugins: [PreludePlugin.shared,
                                              PreparePlugin.shared,
                                              LogPlugin.shared,
                                              ProcessPlugin.shared])
      .rx
      .progressRequest(bean.asMoyaTarget())
  }
}
