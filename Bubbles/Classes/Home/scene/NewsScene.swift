//
//  NewsScene.swift
//  Bubbles
//
//  Created by god on 2018/8/25.
//  Copyright © 2018 God. All rights reserved.
//

import Foundation
import UIKit

class NewsScene: BEUITableViewController {
  
  override func didInitialize(style: UITableViewStyle) {
    super.didInitialize(style: style)
    appearance.navigationBarBackgroundImageOrNil = UIImage.imageCreate(color: UIColor.orange)
    transition.shouldCustomNavigationBarTransitionWhenPushAppearing = true
    transition.shouldCustomNavigationBarTransitionWhenPushDisappearing = true
    transition.shouldCustomNavigationBarTransitionWhenPopAppearing = true
    transition.shouldCustomNavigationBarTransitionWhenPopDisappearing = true
  }
  
  override func setupNavigationItems() {
    super.setupNavigationItems()
    titleView.title = "News"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    tableView.reloadData()
  }
}

extension NewsScene {
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
