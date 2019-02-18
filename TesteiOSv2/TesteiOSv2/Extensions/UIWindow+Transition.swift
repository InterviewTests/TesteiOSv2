//
//  UIWindow+Transition.swift
//  TesteiOSv2
//
//  Created by Gilson Gil on 17/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

import UIKit

extension UIWindow {
  func transition(from fromViewController: UIViewController, to toViewController: UIViewController) {
    guard let oldView = fromViewController.view.snapshotView(afterScreenUpdates: false) else {
      return rootViewController = toViewController
    }
    rootViewController = toViewController
    addSubview(oldView)

    toViewController.view.alpha = 0
    oldView.alpha = 1

    UIView.animate(withDuration: 0.3, animations: {
      toViewController.view.alpha = 1
      oldView.alpha = 0
    }, completion: { _ in
      oldView.removeFromSuperview()
    })
  }
}
