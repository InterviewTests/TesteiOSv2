//
//  KeyboardUtility.swift
//  Palindrome
//
//  Created by Virgilius Santos on 20/10/2018.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import UIKit
import IQKeyboardManager


class KeyboardManager {
    
    static var shared = KeyboardManager()
    init() {}
    
    var enable: Bool = false {
        didSet(newValue) {
            KeyboardManager.shared.enable = newValue
        }
    }
    
}
