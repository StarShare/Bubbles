
import Foundation

public extension Dictionary {
  public static func + (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
    var result = lhs
    rhs.forEach { result[$0] = $1 }
    return result
  }
}
