//
//  PopupsAnimation.swift
//  Pods-Popups_Example
//
//  Created by Nelo on 2021/3/24.
//

import UIKit

public protocol PopupsAnimatorProtocal {
  var showAnimatedTransitioning: UIViewControllerAnimatedTransitioning? { get }
  var dissmissAnimatedTransitioning: UIViewControllerAnimatedTransitioning? { get }
}


public enum AnimationOptions {
  case fade, scale, moveIn, moveOut
}

public class Animator: NSObject, PopupsAnimatorProtocal {
  
  var options: AnimationOptions
  var duration: TimeInterval
  
  required init(options: AnimationOptions) {
    self.options = options
    self.duration = 0.3
  }
  
  public init(options: AnimationOptions, duration: TimeInterval) {
    self.options = options
    self.duration = duration
  }
  
  public var showAnimatedTransitioning: UIViewControllerAnimatedTransitioning? {
    return Show(options: options, duration: duration)
  }
  
  public var dissmissAnimatedTransitioning: UIViewControllerAnimatedTransitioning? {
    return Dismiss(options: options, duration: duration)
  }
}


class Show: NSObject, UIViewControllerAnimatedTransitioning {
  
  var options: AnimationOptions
  var duration: TimeInterval
  
  required init(options: AnimationOptions, duration: TimeInterval) {
    self.options = options
    self.duration = duration
  }
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    duration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
    guard let toVC = transitionContext.viewController(forKey: .to),
          let toView = transitionContext.view(forKey: .to) else { return }
    
    let containerView = transitionContext.containerView
    toView.frame = transitionContext.finalFrame(for: toVC)
    containerView.addSubview(toView)
    
    switch options {
    case .fade:
      toView.alpha = 0
    case .scale:
      toView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
    case .moveIn:
      toView.transform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height)
    case .moveOut:
      toView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
    }
    
    UIView.animate(withDuration: duration) {
      
      switch self.options {
      case .scale, .moveIn, .moveOut:
        toView.transform = .identity
      case .fade:
        toView.alpha = 1
      }
    } completion: { finished in
      transitionContext.completeTransition(finished)
    }
  }
}


class Dismiss: NSObject, UIViewControllerAnimatedTransitioning {
  
  var options: AnimationOptions
  var duration: TimeInterval
  
  required init(options: AnimationOptions, duration: TimeInterval) {
    self.options = options
    self.duration = duration
  }
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    duration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
    guard let fromView = transitionContext.view(forKey: .from) else { return }
    
    UIView.animate(withDuration: duration) {
      
      switch self.options {
      case .fade:
        fromView.alpha = 0
      case .scale:
        fromView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
      case .moveIn:
        fromView.transform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height)
      case .moveOut:
        fromView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height)
      }
    } completion: { finished in
      transitionContext.completeTransition(finished)
    }
  }
  
}
