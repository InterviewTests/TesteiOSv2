//
//  UIResponder+extension.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import UIKit

extension UIResponder {

    private struct Static {
        static weak var responder: UIResponder?
    }

    /// Finds the current first responder
    /// - Returns: the current UIResponder if it exists
    static func currentFirst() -> UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }

    @objc private func _trap() {
        Static.responder = self
    }
}
