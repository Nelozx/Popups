//
//  PresentationController.swift
//  Pods-Popups_Example
//
//  Created by Nelo on 2021/3/24.
//

import UIKit

class PresentationController: UIPresentationController {
  
  var backgroundColor = UIColor(white: 0, alpha: 0.4)
  private lazy var backgroundView: UIView = {
    let view = UIView(frame: .zero)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.isUserInteractionEnabled = false
    view.backgroundColor = backgroundColor
    view.alpha = 0
    return view
  }()
  
  override open func presentationTransitionWillBegin() {
    
    guard let containerView = containerView else { return }
    containerView.addSubview(backgroundView)
    presentedView?.backgroundColor = .clear
    NSLayoutConstraint.activate([
      backgroundView.topAnchor.constraint(equalTo: containerView.topAnchor),
      backgroundView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
    ])
    alongsideTransition(animationIn: true)
  }
  
  override open func dismissalTransitionWillBegin() {
    alongsideTransition(animationIn: false)
  }
  
  private func alongsideTransition(animationIn: Bool) {
    let alpha: CGFloat = animationIn ? 1 : 0
    guard let coordinator = presentedViewController.transitionCoordinator else {
      return
    }
    coordinator.animate(alongsideTransition: { _ in
      self.backgroundView.alpha = alpha
    }, completion: nil)
  }
}
