//
//  PresentedViewController.swift
//  Popups_Example
//
//  Created by Nelo on 2021/3/24.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import Popups
import SnapKit

class ShowViewController: UIViewController, PopupsProtocol {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let ScreenW = UIScreen.main.bounds.width
    let containerView = UIView(frame:.zero)
    containerView.backgroundColor = .white
    view.addSubview(containerView)
    
    containerView.snp.makeConstraints {
      $0.leading.equalTo(20)
      $0.trailing.equalTo(-20)
      $0.height.equalTo(ScreenW-40)
      $0.centerY.equalToSuperview().offset(-50)
    }
    
    let btn = UIButton(frame: .zero)
    btn.setTitle("BACK", for: .normal)
    btn.setTitleColor(.systemRed, for: .normal)
    btn.addTarget(self, action: #selector(click), for: .touchUpInside)
    containerView.addSubview(btn)
    btn.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
  
  @objc func click() {
//    let am = Animator(options: .fade, duration: 0.5)
    Popups.dismiss(self, animationType: .fade)
  }

}
