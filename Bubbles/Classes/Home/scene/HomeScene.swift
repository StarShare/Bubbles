//
//  HomeScene.swift
//  Bubbles
//
//  Created by god on 2018/6/26.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

class HomeScene: BEUICollectionViewController {
  
  var navBarTodayTimeView: HomeNavbarDateView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupNavigationItems() {
    super.setupNavigationItems()
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navBarTodayTimeView)
  }
  
  override func didInitialize(layout: UICollectionViewFlowLayout) {
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    super.didInitialize(layout: layout)
    /// BEUINavigationBarAppearance
    appearance.navigationBarBackgroundImageOrNil = UIImage.imageCreate(color: UIColor.clear)
    appearance.navigationBarShadowImageOrNil = UIImage.imageCreate(color: UIColor.clear)
  }
  
  override func initSubviews() {
    super.initSubviews()
    
    /// navBarTodayTimeView
    navBarTodayTimeView = HomeNavbarDateView()
  }
  
  override func initCollectionView() {
    super.initCollectionView()
    collectionView.showsVerticalScrollIndicator = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: "HomeCollectionCell")
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    navBarTodayTimeView.frame = CGRect.init(x: 0, y: 0, width: 200, height: 44)
  }
  
  override func handleCollectionViewContentInsetChangeEvent(contentInset: UIEdgeInsets) {
    super.handleCollectionViewContentInsetChangeEvent(contentInset: contentInset)
    let width = view.bounds.width - contentInset.left - contentInset.right
    let height = view.bounds.height - contentInset.top - contentInset.bottom
    let contentWidth = width - layout.sectionInset.left - layout.sectionInset.right - layout.minimumLineSpacing
    let contentHeight = height - layout.sectionInset.top - layout.sectionInset.bottom - layout.minimumInteritemSpacing
    layout.itemSize = CGSize(width: contentWidth/2.0, height: contentHeight/2.0)
    layout.invalidateLayout()
  }
}

extension HomeScene {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath)
    return cell
  }
}

