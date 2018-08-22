
import UIKit

extension UINavigationBar {
  
}

open class BEUINavigationTitleView: UIControl {
  
  public private(set) var titleLabel: UILabel!
  
  public var title: String? {
    didSet {
      titleLabel.text = title
      updateTitleLabelSize()
    }
  }
  
  public var titleFont: UIFont? {
    didSet {
      titleLabel.font = titleFont
      updateTitleLabelSize()
    }
  }
  
  private var titleLabelSize: CGSize = .zero
  
  public required override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  public required init() {
    super.init(frame: .zero)
    setup()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  open override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  open func setup() {
    titleLabel = UILabel()
    titleLabel.textAlignment = .center
    titleLabel.lineBreakMode = .byTruncatingTail
    titleLabel.font = BEUIConfiguration.style.navigationBarStyle.navBarTitleFontOrNil
    titleLabel.textColor = BEUIConfiguration.style.navigationBarStyle.navBarTitleColorOrNil
    addSubview(titleLabel)
    isUserInteractionEnabled = false
    contentHorizontalAlignment = .center
    tintColor = BEUIConfiguration.style.navigationBarStyle.navBarTitleColorOrNil
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    titleLabel.frame = bounds
  }
  
  open override func sizeThatFits(_ size: CGSize) -> CGSize {
    return contentSize()
  }
  
  private func contentSize() -> CGSize {
    return titleLabelSize
  }
  
  private func updateTitleLabelSize() {
    if titleLabel.text?.isEmpty == true {
      titleLabelSize = .zero
    } else {
      titleLabelSize = titleLabel.sizeThatFits(CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)))
    }
  }
  
  open override func tintColorDidChange() {
    super.tintColorDidChange()
    titleLabel.textColor = tintColor
  }
}
