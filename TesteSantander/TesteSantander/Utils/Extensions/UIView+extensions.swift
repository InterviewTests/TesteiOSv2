//
//  UIView+extensions.swift
//  TesteSantander
//
//  Created by Felipe Alexander Silva Melo on 29/05/19.
//  Copyright © 2019 Felipe Alexander Silva Melo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fastAnimation(callback: @escaping () -> Void) {
        UIView.animate(withDuration: 0.25, animations: callback)
    }
}
