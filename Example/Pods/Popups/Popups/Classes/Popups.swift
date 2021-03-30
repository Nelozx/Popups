//
//  Popups.swift
//  Pods-Popups_Example
//
//  Created by Nelo on 2021/3/24.
//

import UIKit

public class Popups: NSObject {
  private var maskColor: UIColor? = nil
  private var animator: PopupsAnimatorProtocal
  
  private init (animator: PopupsAnimatorProtocal) {
    self.animator = animator
  }
}

// MARK: Public
extension Popups {
  
  /// 展示弹窗
  /// - Parameters:
  ///   - presented: 展现的view/viewController
  ///   - animationType: 动画类型 默认为缩放
  ///   - presentingViewController: from viewController
  ///   - completion: 过渡完成之后的回调
  public static func show(_ presented: PopupsProtocol,
                          animationOptions: AnimationOptions = .scale,
                          maskColor: UIColor? = nil,
                          presentingViewController: UIViewController? = nil,
                          completion: (() -> Void)? = nil) {
    
    let animator = Animator(options: animationOptions)
    Popups.show(presented, animation: animator, maskColor: maskColor, presentingViewController: presentingViewController, completion: completion)
  }
  
  /// 展示弹窗
  /// - Parameters:
  ///   - presented: 展现的view/viewController
  ///   - animation: 自定义动画
  ///   - maskColor: 遮罩的颜色
  ///   - presentingViewController: from viewController
  ///   - completion: 过渡完成之后的回调
  public  static func show(_ presented: PopupsProtocol,
                           animation: PopupsAnimatorProtocal,
                           maskColor: UIColor? = nil,
                           presentingViewController: UIViewController? = nil,
                           completion: (() -> Void)? = nil) {
    
    let controller = Popups(animator: animation)
    controller.maskColor = maskColor
    let presentedViewController =  presented.presentedViewController
    presentedViewController.transitioningDelegate = controller
    presentedViewController.modalPresentationStyle = .custom
    let presenting = presentingViewController ?? UIWindow.key?.rootViewController
    presenting?.present(presentedViewController, animated: true, completion: completion)
  }
  
  
  /// 隐藏弹窗
  /// - Parameters:
  ///   - presented: 隐藏的view/viewController
  ///   - animationType: 动画类型. 默认是为缩放
  ///   - completion: 过渡完成之后的回调
  public static func dismiss(_ presented: PopupsProtocol,
                             animationType: AnimationOptions = .scale,
                             completion:(()-> Void)? = nil) {
    
    let animator = Animator(options: animationType)
    Popups.dismiss(presented, animation: animator, completion: completion)
  }
  
  
  /// 隐藏弹窗
  /// - Parameters:
  ///   - presented: 隐藏的view/viewController
  ///   - animation: 自定义动画
  ///   - completion: 过渡完成之后的回调
  public static func dismiss(_ presented: PopupsProtocol,
                             animation: PopupsAnimatorProtocal,
                             completion:(()-> Void)? = nil) {
    
    let controller = Popups(animator: animation)
    let presentedViewController = presented.presentedViewController
    presentedViewController.transitioningDelegate = controller
    presentedViewController.modalPresentationStyle = .custom
    presentedViewController.dismiss(animated: true, completion: completion)
  }
}


extension Popups: UIViewControllerTransitioningDelegate {
  
  public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    let presentationController = PresentationController(presentedViewController: presented, presenting: presenting)
    
    if let maskColor = maskColor {
      presentationController.backgroundColor = maskColor
    }
    return presentationController
  }
  
  public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    animator.showAnimatedTransitioning
  }
  
  public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    animator.dissmissAnimatedTransitioning
  }
}


extension UIWindow {
  static var key: UIWindow? {
    if #available(iOS 13, *) {
      return UIApplication.shared.windows.first { $0.isKeyWindow }
    } else {
      return UIApplication.shared.keyWindow
    }
  }
}
