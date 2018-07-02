
import UIKit

open class BEUITableView: UITableView {
  
  public override init(frame: CGRect, style: UITableViewStyle) {
    super.init(frame: frame, style: style)
    didInitialize()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    didInitialize()
  }
  
  /// will call after initialization.
  ///
  /// @see init(frame: CGRect, style: UITableViewStyle)
  /// @see init?(coder aDecoder: NSCoder)
  open func didInitialize() {
    uiStyle = BEUIConfiguration.style.tableStyle
  }
  
  /// The style guide the BEUITableView should use.
  public var uiStyle: BEUITableStyle? {
    didSet {
      guard let uiStyle = uiStyle else { return }
      rowHeight = uiStyle.tableViewCellNormalHeight
      let backColor: UIColor?
      if style == .plain {
        backColor = uiStyle.tableViewPlainBackgroundColorOrNil
        tableFooterView = UIView()
      } else {
        backColor = uiStyle.tableViewGroupedBackgroundColorOrNil
      }
      backgroundColor = backColor
      backgroundView = UIView()
      sectionIndexTrackingBackgroundColor = uiStyle.tableSectionIndexTrackingBackgroundColorOrNil
      sectionIndexBackgroundColor = uiStyle.tableSectionIndexBackgroundColorOrNil
      sectionIndexColor = uiStyle.tableSectionIndexColorOrNil
      separatorColor = uiStyle.tableViewSeparatorColorOrNil
      if uiStyle.tableViewEstimatedHeightEnabled {
        estimatedRowHeight = uiStyle.tableViewCellNormalHeight
        estimatedSectionFooterHeight = uiStyle.tableViewCellNormalHeight
        estimatedSectionHeaderHeight = uiStyle.tableViewCellNormalHeight
      } else {
        estimatedRowHeight = 0
        estimatedSectionFooterHeight = 0
        estimatedSectionHeaderHeight = 0
      }
    }
  }
  
  /// MARK: - Public convenience func.
  
  
  /// IndexPath of view in tableView.
  ///
  /// - Parameter atView: view
  /// - Returns: IndexPath or nil
  public func indexPathForRow(atView: UIView?) -> IndexPath? {
    guard atView?.superview != nil else { return nil }
    guard let view = atView else { return nil }
    
    if view.isKind(of: UITableViewCell.self) {
      if let fatherView = view.superview {
        if NSClassFromString("UITableViewWrapperView") != nil {
          if let cell = fatherView.superview?.superview as? UITableViewCell {
            return indexPath(for: cell)
          }
        } else {
          if let cell = fatherView.superview as? UITableViewCell {
            return indexPath(for: cell)
          }
        }
      }
    }
    
    return indexPathForRow(atView: view.superview)
  }
  
  /// Visible of cell at IndexPath.
  ///
  /// - Parameter atIndexPath: indexPath
  /// - Returns: Visible
  public func cellVisible(atIndexPath: IndexPath) -> Bool {
    return indexPathsForVisibleRows?.map({ indexPath -> Bool in
      indexPath.elementsEqual(atIndexPath)
    }).count == 1
  }
  
  
  /// clears visible cells selection.
  public func clearsSelection() {
    indexPathsForVisibleRows?.forEach({ indexPath in
      deselectRow(at: indexPath, animated: true)
    })
  }
  
  /// realContentSize
  ///
  /// - Returns: content size
  public func realContentSize() -> CGSize {
    if dataSource == nil || delegate == nil {
      return .zero
    }
    
    let footerViewMaxY = tableFooterView?.frame.maxY ?? 0
    var realContentSize = CGSize(width: contentSize.width, height: footerViewMaxY)
    let lastSection = numberOfSections - 1
    if lastSection < 0 {
      return realContentSize
    }
    
    let lastSectionRect = rect(forSection: lastSection)
    realContentSize.height = fmax(realContentSize.height, lastSectionRect.maxY)
    
    return realContentSize
  }
  
  /// realContentInset
  ///
  /// - Returns: content inset
  public func realContentInset() -> UIEdgeInsets {
    if #available(iOS 11.0, *) {
      return adjustedContentInset
    } else {
      return contentInset
    }
  }
  
  /// Tableview can scroll.
  ///
  /// - Returns: can scroll?
  public func canScroll() -> Bool {
    if bounds.height <= 0 {
      return false
    }
    
    if tableHeaderView?.isKind(of: UISearchBar.self) ?? false {
      let canScroll = realContentSize().height + realContentInset().top + realContentInset().bottom > bounds.height
      return canScroll
    } else {
      let canVerticalScroll = contentSize.height + realContentInset().top + realContentInset().bottom > bounds.height
      let canHorizontalScoll = contentSize.width + realContentInset().left + realContentInset().right > bounds.width
      return canVerticalScroll || canHorizontalScoll
    }
  }
}
