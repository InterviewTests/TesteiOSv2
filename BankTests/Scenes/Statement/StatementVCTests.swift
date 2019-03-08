//
//  StatementVCTests.swift
//  BankTests
//
//  Created by Administrador on 08/03/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest
@testable import Bank

class StatementVCTests: XCTestCase {
    
    var viewStatement: StatementVC!
    let user = User(userId: 1, name: "Jeferson", bankAccount: "1-1", agency: "1", balance: 1.0)

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewStatement = storyboard.instantiateViewController(withIdentifier: "StatementVC") as? StatementVC
        var interactor = viewStatement.interactor as! StatementDataStore
        interactor.user = self.user
        viewStatement.interactor = interactor as? StatementBusinessLogic
        _ = viewStatement.view
    }
    
    override func tearDown() {
        viewStatement = nil
        super.tearDown()
    }

    func testLoadUserData() {
        let userDisplay = StatementView.ViewModel.DisplayedStatementUser(user: user)
        viewStatement.setUserData(userDisplay)
        
        XCTAssertEqual(viewStatement.lblUserName.text, user.name, "Nomes não são iguais")
        XCTAssertEqual(viewStatement.lblAccount.text, "\(user.agency) / \(user.bankAccount)", "Agencia/Conta não são iguais")
        XCTAssertEqual(viewStatement.lblBalance.text, Helpers.formmaterCurrency(value: user.balance), "Saldo não são iguais")
    }
    
    func testLoadStatementData() {
        viewStatement.viewWillAppear(false)
        let promise = expectation(description: "Load Statements")
        let when = DispatchTime.now() + 5
        DispatchQueue.main.asyncAfter(deadline: when) {
            if let itens = self.viewStatement.statementsDisplay, itens.count > 0{
                promise.fulfill()
            }
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
}
