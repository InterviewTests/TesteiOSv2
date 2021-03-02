//
//  Extensions.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 01/03/21.
//

import UIKit

// MARK: ViewController extension. Enable 'dismiss keyboard when user taps outside of UITextView'
// "https://medium.com/@sruthicsankar/dismiss-hide-keyboard-by-touching-anywhere-outside-uitextfield-ios-swift-f0a719a91299"

extension UIViewController {
    func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
