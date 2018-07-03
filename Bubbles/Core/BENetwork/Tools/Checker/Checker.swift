
import Foundation
import SwiftyJSON

public class Checker {
  let check: (JSON) throws -> Bool
  
  public init(check: @escaping (JSON) throws -> Bool) {
    self.check = check
  }
}
