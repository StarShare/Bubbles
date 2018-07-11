
import UIKit

open class BEUITableViewController: BEUIViewController {
  
  public override convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.init()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    didInitialize(style: .plain)
  }
  
  public init(style: UITableViewStyle) {
    super.init(nibName: nil, bundle: nil)
    didInitialize(style: style)
  }
  
  public convenience init() {
    self.init(style: .plain)
  }
  
  deinit {
    tableView.delegate = nil
    tableView.dataSource = nil
    if #available(iOS 11.0, *) { } else {
      tableView.removeObserver(self, forKeyPath: "contentInset")
    }
  }
  
  /// will call after initialization.
  ///
  /// @see init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  /// @see init?(coder aDecoder: NSCoder)
  /// @see init(style: UITableViewStyle)
  /// @see init()
  open func didInitialize(style: UITableViewStyle) {
    super.didInitialize()
    tableStyle = style
    hasSetInitialContentInset = false
    tableViewInitialContentInset = BEUITableViewController.contentInsetNotSet
    tableViewInitialScrollIndicatorInsets = BEUITableViewController.contentInsetNotSet
  }
  
  /// this tableView style.
  public var tableStyle: UITableViewStyle!
  
  /// tableview
  /// sometimes get self->tableView ,but the view is not didload.
  /// so excute loadViewIfNeeded() to make viewDidload().
  public var tableView: BEUITableView! {
    get {
      if self.tableView == nil {
        loadViewIfNeeded()
      }
      return self.tableView!
    }
    set {
      self.tableView = newValue
    }
  }
  
  /// inset to Identification tableView contentInset&scrollIndicatorInset not set.
  private static let contentInsetNotSet = UIEdgeInsets(top: -1, left: -1, bottom: -1, right: -1)
  
  /// has set tableView initialContentInset flag.
  private var hasSetInitialContentInset: Bool = false
  
  /// tableView initial contentInset.
  public var tableViewInitialContentInset: UIEdgeInsets! {
    didSet {
      if shouldAdjustTableViewContentInsetsInitially == false {
        if #available(iOS 11.0, *) {
          if isViewLoaded {
            tableView.contentInsetAdjustmentBehavior = .automatic
          }
        } else {
          automaticallyAdjustsScrollViewInsets = true
        }
      } else {
        if #available(iOS 11.0, *) {
          if isViewLoaded {
            tableView.contentInsetAdjustmentBehavior = .never
          }
        } else {
          automaticallyAdjustsScrollViewInsets = false
        }
      }
    }
  }
  
  /// tableView initial scrollIndicatorInsets.
  public var tableViewInitialScrollIndicatorInsets: UIEdgeInsets!
  
  /// return should adjustTableViewContentInsetsInitially.
  fileprivate var shouldAdjustTableViewContentInsetsInitially: Bool {
    return UIEdgeInsetsEqualToEdgeInsets(tableViewInitialContentInset,
                                         BEUITableViewController.contentInsetNotSet) == false
  }
  
  ///  return should adjustTableViewScrollIndicatorInsetsInitially.
  fileprivate var shouldAdjustTableViewScrollIndicatorInsetsInitially: Bool {
    return UIEdgeInsetsEqualToEdgeInsets(tableViewInitialScrollIndicatorInsets,
                                         BEUITableViewController.contentInsetNotSet) == false
  }
  
  /// tableView contentInset did change.
  open func handleTableViewContentInsetChangeEvent(contentInset: UIEdgeInsets) { }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    if tableStyle == .plain {
      view.backgroundColor = tableView.uiStyle?.tableViewPlainBackgroundColorOrNil
    } else {
      view.backgroundColor = tableView.uiStyle?.tableViewGroupedBackgroundColorOrNil
    }
  }
  
  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tableView.clearsSelection()
  }
  
  open override func initSubviews() {
    super.initSubviews()
    initTableView()
  }
  
  open override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    layoutTableView()
    
    if shouldAdjustTableViewContentInsetsInitially && hasSetInitialContentInset == false {
      tableView.contentInset = tableViewInitialContentInset
      if shouldAdjustTableViewScrollIndicatorInsetsInitially {
        tableView.scrollIndicatorInsets = tableViewInitialScrollIndicatorInsets
      } else {
        tableView.scrollIndicatorInsets = tableView.contentInset
      }
      if tableView.canScroll() {
        let topOffset = CGPoint.init(x: -tableView.realContentInset().left, y: -tableView.contentInset.top)
        tableView.setContentOffset(topOffset, animated: false)
      }
      hasSetInitialContentInset = true
    }
  }
  
  open func initTableView() {
    if tableView == nil {
      tableView = BEUITableView.init(frame: view.bounds,
                                     style: tableStyle)
      tableView.delegate = self
      tableView.dataSource = self
      view.addSubview(tableView)
      
      if #available(iOS 11.0, *) {
        if shouldAdjustTableViewContentInsetsInitially {
          tableView.contentInsetAdjustmentBehavior = .never
        }
      } else {
        tableView.addObserver(self,
                              forKeyPath: "contentInset",
                              options: .old,
                              context: nil)
      }
    }
  }
  
  open func layoutTableView() {
    if view.bounds.equalTo(tableView.frame) == false {
      tableView.frame = view.bounds
    }
  }
  
  open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath?.elementsEqual("contentInset") ?? false {
      if #available(iOS 11.0, *) {
        handleTableViewContentInsetChangeEvent(contentInset: tableView.adjustedContentInset)
      } else {
        handleTableViewContentInsetChangeEvent(contentInset: tableView.contentInset)
      }
    }
  }
  
  public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
    if scrollView.isEqual(tableView) {
      if #available(iOS 11.0, *) {
        handleTableViewContentInsetChangeEvent(contentInset: tableView.adjustedContentInset)
      } else {
        handleTableViewContentInsetChangeEvent(contentInset: tableView.contentInset)
      }
    }
  }
}

extension BEUITableViewController: UITableViewDelegate, UITableViewDataSource {
  
  public func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
