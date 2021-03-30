//
//  ViewController.swift
//  Popups
//
//  Created by Nelo on 03/24/2021.
//  Copyright (c) 2021 Nelo. All rights reserved.
//

import UIKit
import Popups

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
      let btn = UIButton(frame: .zero)
      btn.setTitle("我是一个按钮🔘", for: .normal)
      btn.setTitleColor(.red, for: .normal)
      btn.addTarget(self, action: #selector(click), for: .touchUpInside)
      btn.sizeToFit()
      btn.center = self.view.center
      view.addSubview(btn)
      
      let btn1 = UIButton(frame: .zero)
      btn1.setTitle("我是一个按钮🔘", for: .normal)
      btn1.setTitleColor(.red, for: .normal)
      btn1.addTarget(self, action: #selector(click1), for: .touchUpInside)
      btn1.sizeToFit()
      btn1.center = CGPoint(x: view.center.x, y: view.center.y+btn.bounds.height+10)
      view.addSubview(btn1)
      
      
    }
  
  @objc private func click() {
    let vc = ShowViewController()
    Popups.show(vc, animationOptions: .scale)
  }
  @objc private func click1() {
    let view = ShowTestView()
    view.frame.size = CGSize(width: UIScreen.main.bounds.size.width - 70, height: 300)
    Popups.show(view, animationOptions: .moveIn, maskColor: .systemPink)
  }
  
}

