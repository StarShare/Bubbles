
import UIKit

public extension UIImage {
  
  /// Convenient structure with image.
  ///
  /// - Parameters:
  ///   - color: the fill color of image.
  ///   - size: the size of image.
  /// - Returns: UIImage object or nil.
  class func imageCreate(color: UIColor, size: CGSize = CGSize(width: 4, height: 4)) -> UIImage? {
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let rs = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return rs
  }
}
