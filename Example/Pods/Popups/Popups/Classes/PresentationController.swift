//
//  PresentationController.swift
//  Pods-Popups_Example
//
//  Created by Nelo on 2021/3/24.
//

import UIKit

class PresentationController: UIPresentationController {
  
  var backgroundColor = UIColor(white: 0, alpha: 0.4)
  private lazy var backgrounView: UIView = {
    let view = UIView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isUserInteractionEnabled = false
    view.backgroundColor = backgroundColor
    view.alpha = 0
    view.backgroundColor = backgroundColor
    return view
  }()
  
  override open func presentationTransitionWillBegin() {
    
    if let containerView = containerView {
      containerView.insertSubview(backgrounView, at: 0)
      backgrounView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
      backgrounView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
      backgrounView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
      backgrounView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
      alongsideTransition(animationIn: true)
    }
  }
  
  override open func dismissalTransitionWillBegin() {
    alongsideTransition(animationIn: false)
  }
  
  private func alongsideTransition(animationIn: Bool) {
    let alpha: CGFloat = animationIn ? 1 : 0
    // 用于支持与视图控制器转换相关的动画
    if let coordinator = presentedViewController.transitionCoordinator {
      coordinator.animate(alongsideTransition: { _ in
        self.backgrounView.alpha = alpha
      }, completion: nil)
    }
  }
}
