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
    
    var viewController: BankHistoryController?
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "BankHistory", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "BankHistoryController") as! BankHistoryController
        self.viewController = viewController
        UIApplication.shared.keyWindow?.rootViewController = viewController
    }
    
    func test1TableView() {
        let userAccount = UserAccount(userId: 2, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        let statement = Statement(title: "Something", description: "something", date: Date(), value: "200")
        
        viewController?.displayData([statement])
        viewController?.displayHeaderData(userAccount: userAccount)
        
        tester().tapRow(at: IndexPath(row: 0, section: 0), in: viewController?.tableView)
        tester().waitForView(withAccessibilityLabel: "Jose da Silva Teste", traits: [])
        tester().waitForView(withAccessibilityLabel: "\(userAccount.bankAccount!) / \(userAccount.agency!)", traits: [])
        tester().waitForView(withAccessibilityLabel: "\(userAccount.balance!.toStringCurrency())", traits: [])
    }
    
    func test2Header() {
        tester().waitForView(withAccessibilityLabel: "headerView", traits: [])
        tester().tapView(withAccessibilityLabel: "exitButton")
    }
}
