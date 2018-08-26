
import UIKit

extension UINavigationBar {
  
}

open class BEUINavigationTitleView: UIControl {
  
  public private(set) var titleLabel: UILabel!
  
  public var title: String? {
    didSet {
      titleLabel.text = title
      refreshLayout()
    }
  }
  
  public var titleFont: UIFont? {
    didSet {
      titleLabel.font = titleFont
      refreshLayout()
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
  
  private func updateTitleLabelSize(_ size: CGSize) {
    if titleLabel.text?.isEmpty == true {
      titleLabelSize = .zero
    } else {
      titleLabelSize = titleLabel.sizeThatFits(size)
    }
  }
  
  private func refreshLayout() {
    guard let bar = navigationBarSuperviewForSubview(self)  else {
      updateTitleLabelSize(CGSize(width: DEVICE_WIDTH, height: NavigationBarHeight))
      frame = CGRect(origin: frame.origin, size: titleLabelSize)
      return
    }
    if let titleView = bar.topItem?.titleView {
      guard titleView.isKind(of: BEUINavigationTitleView.self) else {return}
      let titleViewMaximumWidth = titleView.bounds.size.width
      updateTitleLabelSize(CGSize(width: titleViewMaximumWidth, height: NavigationBarHeight))
      frame = CGRect(origin: frame.origin, size: titleLabelSize)
    }
  }
  
  private func navigationBarSuperviewForSubview(_ view: UIView) -> UINavigationBar? {
    guard let fatherView = view.superview else {
      return nil
    }
    
    if fatherView.isKind(of: UINavigationBar.self) {
      return fatherView as? UINavigationBar
    }
    
    return navigationBarSuperviewForSubview(fatherView)
  }
  
  open override func tintColorDidChange() {
    super.tintColorDidChange()
    titleLabel.textColor = tintColor
  }
}
