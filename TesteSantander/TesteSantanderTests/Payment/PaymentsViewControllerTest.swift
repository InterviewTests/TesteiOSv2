//
//  PaymentsViewControllerTest.swift
//  TesteSantanderTests
//
//  Created by Henrique Pereira de Lima on 28/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import TesteSantander

class PaymentsViewControllerTest: QuickSpec {
    
    var controller: PaymentsViewController!
    var mock : ResponseTransactions?
    
    override func spec() {
        describe("PaymentsViewController"){
        beforeEach {
            self.controller = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PaymentsViewController") as! PaymentsViewController)
            
            let jsonAccount = """
            {
            "userAccount": {
            "userId": 1,
            "name": "Jose da Silva Teste",
            "bankAccount": "2050",
            "agency": "012314564",
            "balance": 3.3445
            },
            "error": {}
            }
            """.data(using: .utf8)!
             let mockAccount = try! JSONDecoder().decode(ResponseAccount.self, from: jsonAccount)
            self.controller.userAccount = mockAccount.userAccount
            _ = self.controller.view
            
            let json = """
            {
            "statementList": [
            {
            "title": "Pagamento",
            "desc": "Conta de luz",
            "date": "2018-08-15",
            "value": -50
            },
            {
            "title": "TED Recebida",
            "desc": "Joao Alfredo",
            "date": "2018-07-25",
            "value": 745.03
            },
            {
            "title": "DOC Recebida",
            "desc": "Victor Silva",
            "date": "2018-06-23",
            "value": 399.9
            },
            ]
            }
            """.data(using: .utf8)!
            self.mock = try! JSONDecoder().decode(ResponseTransactions.self, from: json)
            self.controller.transactionsList = self.mock!.statementList
        }
            
            context("when view is loaded") {
                
                it("should not have interactor nil") {
                    expect(self.controller.interactor).toNot(beNil())
                }
                
                it("should not have router nil") {
                    expect(self.controller.router).toNot(beNil())
                }
                
                it("should not have presenter nil") {
                    expect(self.controller.interactor?.presenter).toNot(beNil())
                }
                
                it("should not have worker nil") {
                    expect(self.controller.interactor?.worker).toNot(beNil())
                }
                
                it("should have 3 transactions loaded"){
                    expect(self.controller.tableView.numberOfRows(inSection: 0)).to(equal(3))
                }
                
                
                it("should show account content") {
                    self.controller.viewDidLayoutSubviews()
                    let header  = self.controller.tableView.tableHeaderView as? PaymentTableHeader
                    expect(header).notTo(beNil())
                    expect(header?.lblName.text).to(equal("Jose da Silva Teste"))
                    expect(header?.lblAccountNumber.text).to(equal("2050 / 01.231456-4"))
                }
            }
            
            context("Table View"){
                it("should show transaction content") {
                    let cell = self.controller.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! PaymentTableViewCell
                    expect(cell.lblTransactionTitle.text).to(equal("Pagamento"))
                    expect(cell.lblTransactionDate.text).to(equal("2018-08-15"))
                    expect(cell.lblTransaction.text).to(equal("Conta de luz"))
                    expect(cell.lblPrice.text).to(equal("R$ -50,00"))
                }
                
            }
            
            
    }
    }
}

