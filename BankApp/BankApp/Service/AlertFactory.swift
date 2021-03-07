//
//  AlertFactory.swift
//  BankApp
//  Factory of UIAlertControllers. Create an alert for each situation.
//
//  Created by Adriano Rodrigues Vieira on 04/03/21.
//

import Foundation
import UIKit

struct AlertFactory {
    private init() {}
    
    /// Creates an alert based on a `message` and an `code`
    /// - parameter message: the message
    /// - parameter code: the code returned by the endpoint
    /// - returns: an `UIAlertController` object who represents the alert.
    static func createAlert(withMessage message: String, andCode code: Int) -> UIAlertController {
        return Self.createAlert(withMessage: "\(code) - \(message)")
    }
    
    
    /// Analyzes the parameters `userText` and `passwordText`, and if it does not corresponds to valid username and password, returns
    /// an  `UIAlertController` with a custom message explaining the problem. If the `userText` and `passwordText` matches the patterns,
    /// returns `nil`.
    /// - **Never force the return of this method** when calling, like this:
    ///
    ///   ` let alert = AlertFactory.createAlertBasedOnContentsOf(userText: "a@aol.com", passwordText: "Test@1")!`
    ///
    ///   because if the parameters are correct, it will cause a crash in the application. Prefer to use `guard let`, `if let` or something similar, to ensure
    ///   the safe object.
    ///
    /// - parameter userText: the user, which can be or not be an user valid (aka. an email valid or a CPF valid)
    /// - parameter passwordText: the password, which can be or not be an password valid
    /// - returns: an `UIAlertController` object who represents the alert if the `userText` and `passwordText` parameters match, or `nil` if the `userText` and `passwordText` match (if both match, there is no need of alert)
    static func createAlertBasedOnContentsOf(userText: String?, passwordText: String?) -> UIAlertController? {
        var phrase = ALERT_LABELS.INITIAL
        
        if !userText!.isEmpty && !passwordText!.isEmpty {
            let isUserValid = LoginValidation.validateEmail(userText!) || LoginValidation.validateCpf(userText!)
            let isPasswordValid = LoginValidation.validatePassword(passwordText!)
            
            if (!isUserValid || !isPasswordValid) {
                if !isUserValid {
                    phrase += ALERT_LABELS.USER_INVALID
                    
                    if !isPasswordValid {
                        phrase += ALERT_LABELS.CARRIAGE_RETURN
                    }
                }
                if !isPasswordValid {
                    phrase += ALERT_LABELS.PASSWORD_INVALID
                }
                return createAlert(withMessage: phrase)
            } else {
                return nil
            }
        } else {
            if userText!.isEmpty {
                phrase += ALERT_LABELS.USER_FIELD_BLANK
            }
            if passwordText!.isEmpty {
                phrase += ALERT_LABELS.PASSWORD_FIELD_BLANK
            }
            return createAlert(withMessage: phrase)
        }
    }
    
    
    /// Creates an alert based on a `message`.
    /// - parameter message: the message
    /// - returns: an `UIAlertController` object who represents the alert.
    private static func createAlert(withMessage message: String) -> UIAlertController {
        let alert = UIAlertController(title: ALERT_LABELS.TITLE, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: ALERT_LABELS.ACTION_BUTTON_TITLE, style: .default, handler: nil)
        alert.addAction(okAction)
        
        return alert
    }
}
