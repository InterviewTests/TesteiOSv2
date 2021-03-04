//
//  AlertFactory.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 04/03/21.
//

import Foundation
import UIKit

struct AlertFactory {
    private init() {}
    
    static func createAlertBasedOnContentsOf(userText: String?, passwordText: String?) -> UIAlertController? {
        var phrase = PHRASES.INITIAL
        
        if let userNameString = userText, let userPasswordString = passwordText {
            let isUserValid = LoginValidation.validateEmail(userNameString) || LoginValidation.validateCpf(userNameString)
            let isPasswordValid = LoginValidation.validatePassword(userPasswordString)
            
            if (!isUserValid || !isPasswordValid) {
                if !isUserValid {
                    phrase += PHRASES.USER_INVALID
                    
                    if !isPasswordValid {
                        phrase += PHRASES.CARRIAGE_RETURN
                    }
                }
                if !isPasswordValid {
                    phrase += PHRASES.PASSWORD_INVALID
                }
                return createAlert(withMessage: phrase)
            } else {
                return nil
            }
        } else {
            if userText == nil {
                phrase += PHRASES.USER_FIELD_BLANK
            }
            if passwordText == nil {
                phrase += PHRASES.PASSWORD_FIELD_BLANK
            }
            return createAlert(withMessage: phrase)
        }
    }
    
    private static func createAlert(withMessage message: String) -> UIAlertController {
        let alert = UIAlertController(title: ALERT_LABELS.TITLE, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: ALERT_LABELS.ACTION_BUTTON_TITLE, style: .default, handler: nil)
        alert.addAction(okAction)
        
        return alert
    }
}
