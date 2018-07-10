//
//  HomeCollectionCell.swift
//  Bubbles
//
//  Created by god on 2018/7/9.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

public class HomeCollectionCell: UICollectionViewCell {
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    clipsToBounds = true
    backgroundColor = UIColor.clear
    contentView.clipsToBounds = true
    contentView.backgroundColor = UIColor.clear
    contentView.layer.cornerRadius = 10.0
    contentView.layer.borderWidth = 1.0/UIScreen.main.scale
    contentView.layer.borderColor = UIColor.lightGray.cgColor
    contentView.layer.masksToBounds = true
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
