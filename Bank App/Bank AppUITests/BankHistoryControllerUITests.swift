//
//  BankHistoryController.swift
//  Bank AppUITests
//
//  Created by Chrystian Salgado on 19/02/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class BankHistoryControllerUITests: KIFTestCase {
    
    let emailFieldPlaceholder = NSLocalizedString("EMAIL_PLACEHOLDER", comment: "")
    let passwordFieldPlaceholder = NSLocalizedString("PASSWORD_PLACEHOLDER", comment: "")
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "BankHistory", bundle: Bundle.main)
        let viewController = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    func test2Header() {
        tester().waitForView(withAccessibilityLabel: "headerView", traits: [])
        tester().tapView(withAccessibilityLabel: "exitButton")
    }
}
