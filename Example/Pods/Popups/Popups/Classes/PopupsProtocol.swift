//
//  PopupsProtocol.swift
//  Pods-Popups_Example
//
//  Created by Nelo on 2021/3/24.
//

import UIKit

public protocol PopupsProtocol: class {
  var presentedViewController: UIViewController { get }
  var offset: CGPoint { get }
}

extension PopupsProtocol where Self: UIViewController {
  public var presentedViewController: UIViewController {
    return self
  }
  public var offset: CGPoint {
    return CGPoint(x: 0, y: 0)
  }
}

extension PopupsProtocol where Self: UIView {
  public var presentedViewController: UIViewController {
    if let viewController = self.viewController as? PopupsProtocol {
      return viewController.presentedViewController
    } else {
      return ContainerViewController(contentView: self)
    }
  }
  
  public var offset: CGPoint {
    return CGPoint(x: 0, y: 0)
  }
}


private class ContainerViewController: UIViewController, PopupsProtocol {
  
  var contentView: UIView & PopupsProtocol
  
  init(contentView: UIView & PopupsProtocol) {
    self.contentView = contentView
    super.init(nibName: nil, bundle: nil)
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .clear
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: contentView.offset.y).isActive = true
    contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: contentView.offset.x).isActive = true
    contentView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width).isActive = true
    contentView.heightAnchor.constraint(equalToConstant: contentView.frame.size.height).isActive = true
  }
}


extension UIView {
  
  var viewController: UIViewController? {
    var next = self.next
    while next != nil {
      if let next = next as? UIViewController {
        return next
      } else {
        next = next?.next
      }
    }
    return nil
  }
}
