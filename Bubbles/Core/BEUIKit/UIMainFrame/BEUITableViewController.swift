
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
  
  open func didInitialize(style: UITableViewStyle) {
    super.didInitialize()
    tableStyle = style
    tableViewInitialContentInset = BEUITableViewController.contentInsetNotSet
    tableViewInitialScrollIndicatorInsets = BEUITableViewController.contentInsetNotSet
  }
  
  public var tableStyle: UITableViewStyle!
  
  private var privateTableView: BEUITableView?
  public var tableView: BEUITableView! {
    get {
      if self.privateTableView == nil {
        loadViewIfNeeded()
      }
      return self.privateTableView!
    }
    set {
      self.privateTableView = newValue
    }
  }
  
  private static let contentInsetNotSet = UIEdgeInsets(top: -1, left: -1, bottom: -1, right: -1)
  private var hasSetInitialContentInset: Bool = false
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
  
  public var tableViewInitialScrollIndicatorInsets: UIEdgeInsets!
  
  fileprivate var shouldAdjustTableViewContentInsetsInitially: Bool {
    return UIEdgeInsetsEqualToEdgeInsets(tableViewInitialContentInset,
                                         BEUITableViewController.contentInsetNotSet) == false
  }
  
  fileprivate var shouldAdjustTableViewScrollIndicatorInsetsInitially: Bool {
    return UIEdgeInsetsEqualToEdgeInsets(tableViewInitialScrollIndicatorInsets,
                                         BEUITableViewController.contentInsetNotSet) == false
  }
  
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
    if privateTableView == nil {
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
