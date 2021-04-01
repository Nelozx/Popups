//
//  PresentedViewController.swift
//  Popups_Example
//
//  Created by Nelo on 2021/3/24.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import Popups

class ShowViewController: UIViewController, PopupsProtocol {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .green
    let ScreenW = UIScreen.main.bounds.width
    let containerView = UIView(frame:.zero)
    containerView.backgroundColor = .white
    view.addSubview(containerView)
    
    containerView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      containerView.heightAnchor.constraint(equalToConstant: ScreenW-40),
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50)
    ])
    
    let btn = UIButton(frame: .zero)
    btn.setTitle("BACK", for: .normal)
    btn.setTitleColor(.systemRed, for: .normal)
    btn.addTarget(self, action: #selector(click), for: .touchUpInside)
    containerView.addSubview(btn)
    btn.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      btn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      btn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  private func makeConstraints() {
    
  }
  
  @objc func click() {
//    let am = Animator(options: .fade, duration: 0.5)
    Popups.dismiss(self, animationType: .fade)
  }

}
