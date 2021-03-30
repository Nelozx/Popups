//
//  ShowTestView.swift
//  Popups_Example
//
//  Created by Nelo on 2021/3/30.
//  Copyright © 2021 Nelo DMR. All rights reserved.
//

import UIKit
import Popups

class ShowTestView: UIView, PopupsProtocol {
  
  lazy var label: UILabel = {
    let label = UILabel()
    label.text = "This is label"
    label.textColor = UIColor.orange
    label.backgroundColor = UIColor.red
    label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
    return label
  }()
  
 
  lazy var backItem: UIButton = {
    let backItem = UIButton()
    backItem.setTitle("8⃣️", for: .normal)
    backItem.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
    return backItem
  }()
  
  @objc private func actionBack() {
    Popups.dismiss(self)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .gray
    
    self.addSubview(label)
    self.addSubview(backItem)
    
    
    label.snp.makeConstraints {
      $0.top.equalTo(10)
      $0.centerX.equalToSuperview()
    }
    backItem.snp.makeConstraints {
      $0.top.equalTo(label.snp.bottom).offset(10)
      $0.centerX.equalToSuperview()
      
    }
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}
