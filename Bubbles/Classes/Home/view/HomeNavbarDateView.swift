//
//  HomeNavbarDateView.swift
//  Bubbles
//
//  Created by god on 2018/7/9.
//  Copyright © 2018年 God. All rights reserved.
//

import UIKit

public class HomeNavbarDateView: UIView {
  
  var dateLabel: UILabel
  
  public override init(frame: CGRect) {
    dateLabel = UILabel()
    dateLabel.backgroundColor = UIColor.clear
    dateLabel.textColor = UIColor.lightGray
    dateLabel.textAlignment = .left
    dateLabel.font = UIFont.boldSystemFont(ofSize: 20)
    dateLabel.text = "7月09日 星期一"
    super.init(frame: frame)
    addSubview(dateLabel)
    backgroundColor = UIColor.clear
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    dateLabel.frame = bounds
  }
}
