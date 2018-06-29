
import Foundation

public class ModuleService {
  
  public static let shared = ModuleService()
  private let moduleManager = ModuleManager.shared
  private let moduleLoader  = ModuleLoader.shared
  
  @discardableResult
  public func loadAndRegister(_ moduleConfig: ModuleConfig) -> Module? {
    if moduleConfig.enabled == true {
      do {
        let module = try moduleLoader.load(moduleConfig)
        moduleManager.register(module)
        return module
      } catch let e {
        titan_log(
          "mod load failed:\(moduleConfig.name) -> \(moduleConfig.version) : \(e.localizedDescription)",
          identifier: "ModuleService"
        )
        return nil
      }
    }
    
    titan_log(
      "mod disabled:\(moduleConfig.name) -> \(moduleConfig.version)",
      identifier: "ModuleService"
    )
    removeModule(moduleConfig.name)
    titan_log(
      "remove disabled mod:\(moduleConfig.name) -> \(moduleConfig.version)",
      identifier: "ModuleService"
    )
    return nil
  }
  
  @discardableResult
  public func removeModule(_ moduleName: String) -> Module? {
    let removed = moduleManager.remove(moduleName)
    return removed
  }
}
