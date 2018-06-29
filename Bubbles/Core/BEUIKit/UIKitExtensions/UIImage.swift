
import UIKit

public extension UIImage {
  
  convenience init?(color_be color: UIColor, size: CGSize = CGSize(width: 4, height: 4)) {
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    self.init(cgImage:(UIGraphicsGetImageFromCurrentImageContext()?.cgImage!)!)
    UIGraphicsEndImageContext()
  }
}
