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
    titleView.title = "WeChat"
  }
  
  override func didInitialize(layout: UICollectionViewFlowLayout) {
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    super.didInitialize(layout: layout)
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
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let news = NewsScene()
    navigationController?.pushViewController(news, animated: true)
  }
}

