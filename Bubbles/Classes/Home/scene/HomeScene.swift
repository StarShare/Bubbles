//
//  HomeScene.swift
//  Bubbles
//
//  Created by god on 2018/6/26.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

class HomeScene: BEUIViewController {
  
  var navBarTodayTimeView: HomeNavbarDateView!
  var layout: UICollectionViewFlowLayout!
  var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupNavigationItems() {
    super.setupNavigationItems()
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navBarTodayTimeView)
  }
  
  override func didInitialize() {
    super.didInitialize()
    
    /// BEUINavigationBarAppearance
    appearance.navigationBarBackgroundImageOrNil = UIImage.imageCreate(color: UIColor.clear)
    appearance.navigationBarShadowImageOrNil = UIImage.imageCreate(color: UIColor.clear)
  }
  
  override func initSubviews() {
    super.initSubviews()
    
    /// navBarTodayTimeView
    navBarTodayTimeView = HomeNavbarDateView()
    
    /// collectionView
    layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundView = UIView()
    collectionView.backgroundColor = UIColor.clear
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: "HomeCollectionCell")
    view.addSubview(collectionView)
    if #available(iOS 11.0, *) {
      collectionView.contentInsetAdjustmentBehavior = .automatic
    } else {
      collectionView.addObserver(self,
                                 forKeyPath: "contentInset",
                                 options: .old,
                                 context: nil)
    }
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    navBarTodayTimeView.frame = CGRect.init(x: 0, y: 0, width: 200, height: 44)
    collectionView.frame = view.bounds
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
  
  func handleCollectionViewContentInsetChangeEvent(contentInset: UIEdgeInsets) {
    let width = view.bounds.width - contentInset.left - contentInset.right
    let height = view.bounds.height - contentInset.top - contentInset.bottom
    let contentWidth = width - layout.sectionInset.left - layout.sectionInset.right - layout.minimumLineSpacing
    let contentHeight = height - layout.sectionInset.top - layout.sectionInset.bottom - layout.minimumInteritemSpacing
    layout.itemSize = CGSize(width: contentWidth/2.0, height: contentHeight/2.0)
    layout.invalidateLayout()
  }
}

extension HomeScene: UICollectionViewDelegate,UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath)
    return cell
  }
}

