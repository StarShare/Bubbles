
import Foundation

public protocol CachePolicy {
  
  /// Whether the flag needs to be cached.
  var enable: Bool { get }
  
  /// Cache key of the response use by CacheCore.
  var key: String? { get }
}
