
import Foundation
import Moya

public enum CoreError: Swift.Error {
  case moyaError(MoyaError)
  case responseSerializer(Response)
  case validDataNull
  case checkFailed
  case businessError(String?)
  case jsonModel(String)
  case noneCache
}

public extension CoreError {
  var response: Moya.Response? {
    switch self {
    case .moyaError(let error): return error.response
    case .validDataNull: return nil
    case .checkFailed: return nil
    case .businessError: return nil
    case .jsonModel: return nil
    case .responseSerializer(let response): return response
    case .noneCache: return nil
    }
  }
}

extension CoreError: LocalizedError {
  public var errorDescription: String? {
    switch self {
    case .moyaError(let error):
      return error.localizedDescription
    case .validDataNull:
      return "null valid data."
    case .checkFailed:
      return "json data check failed."
    case .businessError(let description):
      return description
    case .jsonModel(let description):
      return description
    case .responseSerializer:
      return "response serializer failed."
    case .noneCache:
      return "not load cache."
    }
  }
}
