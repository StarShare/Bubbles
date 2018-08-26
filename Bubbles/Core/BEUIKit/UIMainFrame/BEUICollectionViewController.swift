
import UIKit

open class BEUICollectionViewController: BEUIViewController {
  
  public override convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    self.init()
  }
  
  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    didInitialize(layout: UICollectionViewFlowLayout())
  }
  
  public init(layout: UICollectionViewFlowLayout) {
    super.init(nibName: nil, bundle: nil)
    didInitialize(layout: layout)
  }
  
  public convenience init() {
    self.init(layout: UICollectionViewFlowLayout())
  }
  
  deinit {
    collectionView.delegate = nil
    collectionView.dataSource = nil
    if #available(iOS 11.0, *) { } else {
      collectionView.removeObserver(self, forKeyPath: "contentInset")
    }
  }
  
  /// will call after initialization.
  ///
  /// @see init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  /// @see init?(coder aDecoder: NSCoder)
  /// @see init(layout: UICollectionViewLayout)
  /// @see init()
  open func didInitialize(layout: UICollectionViewFlowLayout) {
    super.didInitialize()
    self.layout = layout
    collectionViewInitialContentInset = BEUICollectionViewController.contentInsetNotSet
    collectionViewInitialScrollIndicatorInsets = BEUICollectionViewController.contentInsetNotSet
  }
  
  /// collectionView layout
  public var layout: UICollectionViewFlowLayout!
  
  /// collectionView
  public var _collectionView: BEUICollectionView!
  public var collectionView: BEUICollectionView! {
    get {
      if _collectionView == nil {
        loadViewIfNeeded()
      }
      return _collectionView
    }
    set {
      _collectionView = newValue
    }
  }
  
  /// inset to Identification collectionView contentInset&scrollIndicatorInset not set.
  private static let contentInsetNotSet = UIEdgeInsets(top: -1, left: -1, bottom: -1, right: -1)
  
  /// has set collectionView initialContentInset flag.
  private var hasSetInitialContentInset: Bool = false
  
  /// collectionView initial contentInset.
  public var collectionViewInitialContentInset: UIEdgeInsets! {
    didSet {
      if shouldAdjustCollectionViewContentInsetsInitially == false {
        if #available(iOS 11.0, *) {
          if isViewLoaded {
            collectionView.contentInsetAdjustmentBehavior = .automatic
          }
        } else {
          automaticallyAdjustsScrollViewInsets = true
        }
      } else {
        if #available(iOS 11.0, *) {
          if isViewLoaded {
            collectionView.contentInsetAdjustmentBehavior = .never
          }
        } else {
          automaticallyAdjustsScrollViewInsets = false
        }
      }
    }
  }
  
  /// collectionView initial scrollIndicatorInsets.
  public var collectionViewInitialScrollIndicatorInsets: UIEdgeInsets!
  
  /// return should adjustCollectionViewContentInsetsInitially.
  fileprivate var shouldAdjustCollectionViewContentInsetsInitially: Bool {
    return UIEdgeInsetsEqualToEdgeInsets(collectionViewInitialContentInset,
                                         BEUICollectionViewController.contentInsetNotSet) == false
  }
  
  ///  return should adjustCollectionViewScrollIndicatorInsetsInitially.
  fileprivate var shouldAdjustCollectionViewScrollIndicatorInsetsInitially: Bool {
    return UIEdgeInsetsEqualToEdgeInsets(collectionViewInitialScrollIndicatorInsets,
                                         BEUICollectionViewController.contentInsetNotSet) == false
  }
  
  /// collectionView contentInset did change.
  open func handleCollectionViewContentInsetChangeEvent(contentInset: UIEdgeInsets) { }
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    if let uiStyle = uiStyle {
      collectionView.backgroundColor = uiStyle.backgroundColorOrNil
    }
  }
  
  open override func initSubviews() {
    super.initSubviews()
    initCollectionView()
  }
  
  open override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    layoutCollectionView()
    
    if shouldAdjustCollectionViewContentInsetsInitially && hasSetInitialContentInset == false {
      collectionView.contentInset = collectionViewInitialContentInset
      if shouldAdjustCollectionViewScrollIndicatorInsetsInitially {
        collectionView.scrollIndicatorInsets = collectionViewInitialScrollIndicatorInsets
      } else {
        collectionView.scrollIndicatorInsets = collectionView.contentInset
      }
      hasSetInitialContentInset = true
    }
  }
  
  open func initCollectionView() {
    if _collectionView == nil {
      collectionView = BEUICollectionView.init(frame: view.bounds,
                                               collectionViewLayout: layout)
      collectionView.backgroundView = UIView()
      collectionView.delegate = self
      collectionView.dataSource = self
      view.addSubview(collectionView)
      
      if #available(iOS 11.0, *) {
        if shouldAdjustCollectionViewContentInsetsInitially {
          collectionView.contentInsetAdjustmentBehavior = .never
        }
      } else {
        collectionView.addObserver(self,
                                   forKeyPath: "contentInset",
                                   options: .old,
                                   context: nil)
      }
    }
  }
  
  open func layoutCollectionView() {
    if view.bounds.equalTo(collectionView.frame) == false {
      collectionView.frame = view.bounds
    }
  }
  
  open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    if keyPath?.elementsEqual("contentInset") ?? false {
      if #available(iOS 11.0, *) {
        handleCollectionViewContentInsetChangeEvent(contentInset: collectionView.adjustedContentInset)
      } else {
        handleCollectionViewContentInsetChangeEvent(contentInset: collectionView.contentInset)
      }
    }
  }
  
  public func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
    if scrollView.isEqual(collectionView) {
      if #available(iOS 11.0, *) {
        handleCollectionViewContentInsetChangeEvent(contentInset: collectionView.adjustedContentInset)
      } else {
        handleCollectionViewContentInsetChangeEvent(contentInset: collectionView.contentInset)
      }
    }
  }
}

extension BEUICollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 0
  }
  
  public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    return UICollectionViewCell()
  }
}
