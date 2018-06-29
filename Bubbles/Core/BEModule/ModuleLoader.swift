
import Foundation

public class ModuleLoader {
  
  public static let shared = ModuleLoader()
  
  public func load(_ moduleConfig: ModuleConfig) throws -> Module {
    guard moduleConfig.enabled == true else {
      throw ModuleError.moduleDisable
    }
    
    guard moduleConfig.name.count > 0 else {
      throw ModuleError.missModuleName
    }
    
    guard moduleConfig.version.count > 0 else {
      throw ModuleError.missModuleVersion
    }
    
    let cls: Module.Type = moduleConfig.moduleClass
    
    titan_log(
      "load mod:\(moduleConfig.name) -> \(moduleConfig.version)",
      identifier: "ModuleLoader"
    )
    
    let module = cls.init(moduleConfig)
    module.registerServices()
    return module
  }
}
