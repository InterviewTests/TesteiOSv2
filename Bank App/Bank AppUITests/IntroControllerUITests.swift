//
//  Bank_AppUITests.swift
//  Bank AppUITests
//
//  Created by Chrystian Salgado on 19/02/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class IntroControllerUITests: KIFTestCase {
    
    let emailFieldPlaceholder = NSLocalizedString("EMAIL_PLACEHOLDER", comment: "")
    let passwordFieldPlaceholder = NSLocalizedString("PASSWORD_PLACEHOLDER", comment: "")
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    func test1ViewSetup() {
        tester().waitForView(withAccessibilityLabel: emailFieldPlaceholder, traits: [])
        tester().waitForView(withAccessibilityLabel: passwordFieldPlaceholder, traits: [])
        tester().waitForView(withAccessibilityLabel: "Login", traits: .notEnabled)
    }

    /// Try catch password error.
    func test2PasswordWrongError() {
        tester().tapView(withAccessibilityLabel: passwordFieldPlaceholder)
        tester().waitForSoftwareKeyboard()
        tester().enterText(intoCurrentFirstResponder: "123456")
        tester().waitForView(withAccessibilityLabel: "Login", traits: .notEnabled)
    }
    
    /// Try a login.
    func test3UserAndPasswordError() {
        // Try enter some data into emailTf
        tester().tapView(withAccessibilityLabel: emailFieldPlaceholder)
        tester().waitForSoftwareKeyboard()
        tester().enterText(intoCurrentFirstResponder: "test_user")
        
        // Try enter some data into passwordTf
        getPasswordTfName { (textFieldName) in
            self.tester().tapView(withAccessibilityLabel: textFieldName)
            self.tester().waitForSoftwareKeyboard()
            self.tester().enterText(intoCurrentFirstResponder: "Test@1")
        }
        
        tester().tapView(withAccessibilityLabel: "Login")
        tester().waitForView(withAccessibilityLabel: "OK", traits: [])
        tester().tapView(withAccessibilityLabel: "OK")
    }
    
    /// Try a login.
    func test4LoginSuccess() {
        getPasswordTfName { (textFieldName) in
            self.tester().tapView(withAccessibilityLabel: self.emailFieldPlaceholder)
            self.tester().waitForSoftwareKeyboard()
            self.tester().enterText(intoCurrentFirstResponder: "test_user")
            
            // Try enter some data into passwordTf
            self.tester().tapView(withAccessibilityLabel: textFieldName)
            self.tester().waitForSoftwareKeyboard()
            self.tester().enterText(intoCurrentFirstResponder: "Test20@9")
            
            self.tester().tapView(withAccessibilityLabel: "Login")
        }
    }
    
    private func getPasswordTfName(completion: @escaping (_ tfName: String)->Void) {
        // Try enter some data into emailTf
        do {
            try tester().tryFindingTappableView(withAccessibilityLabel: passwordFieldPlaceholder)
            completion(passwordFieldPlaceholder)
        } catch {
            do {
                let tfName = NSLocalizedString("SENHA_INVALIDA", comment: "")
                try tester().tryFindingTappableView(withAccessibilityLabel: tfName)
                completion(tfName)
            } catch {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
