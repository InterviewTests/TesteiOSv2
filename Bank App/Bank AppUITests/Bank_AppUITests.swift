//
//  Bank_AppUITests.swift
//  Bank AppUITests
//
//  Created by Chrystian Salgado on 19/02/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class Bank_AppUITests: KIFTestCase {
    
    let emailFieldPlaceholder = NSLocalizedString("EMAIL_PLACEHOLDER", comment: "")
    let passwordFieldPlaceholder = NSLocalizedString("PASSWORD_PLACEHOLDER", comment: "")
    let passwordErrorFeedbackPlaceholder = NSLocalizedString("SENHA_INVALIDA", comment: "")
    
    func test1ViewSetup() {
        tester().waitForView(withAccessibilityLabel: emailFieldPlaceholder, traits: [])
        tester().waitForView(withAccessibilityLabel: passwordFieldPlaceholder, traits: [])
    }

    /// Try catch password error.
    func test2PasswordWrongError() {
        tester().tapView(withAccessibilityLabel: passwordFieldPlaceholder)
        tester().waitForSoftwareKeyboard()
        tester().enterText(intoCurrentFirstResponder: "123456")
        tester().tapView(withAccessibilityLabel: "Login")
        tester().waitForView(withAccessibilityLabel: "Senha invalida", traits: [])
        tester().waitForView(withAccessibilityLabel: "OK", traits: [])
        tester().tapView(withAccessibilityLabel: "OK")
    }
    
    /// Try a login.
    func test3LoginInterface() {
        // Try enter some data into emailTf
        tester().tapView(withAccessibilityLabel: emailFieldPlaceholder)
        tester().waitForSoftwareKeyboard()
        tester().enterText(intoCurrentFirstResponder: "test_user")
        
        // Try enter some data into passwordTf
        tester().tapView(withAccessibilityLabel: passwordErrorFeedbackPlaceholder)
        tester().waitForSoftwareKeyboard()
        tester().enterText(intoCurrentFirstResponder: "Test@1")
        
        tester().tapView(withAccessibilityLabel: "Login")
        tester().waitForView(withAccessibilityLabel: "OK", traits: [])
        tester().tapView(withAccessibilityLabel: "OK")
    }
}
