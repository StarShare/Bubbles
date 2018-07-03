
import Foundation
import SwiftyJSON

public class CheckerFactory {
  
  public static func none() -> Checker {
    let check: (JSON) throws -> Bool = { json in
      return true
    }
    return Checker.init(check: check)
  }
}
