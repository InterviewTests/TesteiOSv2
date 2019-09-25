//
//  StatementViewControllerTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 25/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class StatementViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func getViewController(loading: Bool) -> StatementViewController? {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "Statement")
            as? StatementViewController else {
                return nil
        }
        
        if loading {
            let user = User(userId: 1, name: "Teste Mockado", bankAccount: "123", agency: "456", balance: 123)
            
            vc.router?.dataStore?.user = user
            
            let _ = vc.view // Isso vai chamar o viewDidLoad
        }
        
        return vc
    }
    
    func testLoading() {
        guard let vc = getViewController(loading: true) else { fail() ; return }

        XCTAssertNotNil(vc)
    }
    
    func testTableViewDataSource() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        
        let sections = vc.numberOfSections(in: vc.tableView)
        
        XCTAssert(sections == 1,
                  "Há apenas uma sessão")
        
        let statementTest1 = StatementUser.init(title: "Teste 1", desc: "Teste 1", date: "Teste 1", value: 01.2)
        let statementTest2 = StatementUser.init(title: "Teste 2", desc: "Teste 2", date: "Teste 2", value: 02.3)
        
        let statements = [statementTest1, statementTest2]
        vc.listStatements = statements

        let rows = vc.tableView(vc.tableView, numberOfRowsInSection: 0)

        XCTAssert(rows == vc.listStatements.count,
                  "Deve ser igual ao listStatements.count")
    }
}
