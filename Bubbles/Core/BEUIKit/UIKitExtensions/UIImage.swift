
import UIKit

public extension UIImage {
  
  class func imageCreate(color: UIColor, size: CGSize = CGSize(width: 4, height: 4)) -> UIImage? {
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
    let context = UIGraphicsGetCurrentContext()
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    let rs = UIImage(cgImage:(UIGraphicsGetImageFromCurrentImageContext()?.cgImage!)!)
    UIGraphicsEndImageContext()
    return rs
  }
}
