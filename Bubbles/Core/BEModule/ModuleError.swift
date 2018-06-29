
import Foundation

public enum ModuleError: Swift.Error {
  
  case notComplyModuleProtocol
  case missModuleName
  case missModuleVersion
  case moduleDisable
  case serviceHasBeenRegisted
  case serviceInstantiationFailure
}

extension ModuleError {
  
  public var localizedDescription: String {
    switch self {
    case .notComplyModuleProtocol:
      return "you need comply Module protocol."
    case .missModuleName:
      return "miss Module name."
    case .missModuleVersion:
      return "miss Module version."
    case .moduleDisable:
      return "Module disable."
    case .serviceHasBeenRegisted:
      return "Service has been registed."
    case .serviceInstantiationFailure:
      return "Service instantiation failure."
    }
  }
}
