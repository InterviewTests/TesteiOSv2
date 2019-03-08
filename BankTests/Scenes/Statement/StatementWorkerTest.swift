//
//  StatementWorkerTest.swift
//  BankTests
//
//  Created by Administrador on 08/03/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest
@testable import Bank

class StatementWorkerTest: XCTestCase {

    var statementWorker: StatementWorker!
    
    override func setUp() {
        super.setUp()
        statementWorker = StatementWorker(bankStore: BankAPI())
    }
    
    override func tearDown() {
        statementWorker = nil
        super.tearDown()
    }

    func testRequestStatements() {
        let promise = expectation(description: "Request Success")
        do {
            try statementWorker.getStatements(userId: 1) { (statements, error) in
                if statements != nil && (statements?.count)! > 0 {
                    promise.fulfill()
                }
                else
                {
                    XCTFail("Ocorreu um problema na requisição")
                }
            }
        } catch {
            XCTFail("Ocorreu um problema na requisição")
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    /*func testInvalidRequestStatements() {
        let promise = expectation(description: "Request Invalid")
        do {
            try statementWorker.getStatements(userId: -1) { (statements, error) in
                 if statements == nil && error != nil{
                    promise.fulfill()
                }
                else
                {
                    XCTFail("Ocorreu um problema na requisição")
                }
            }
        } catch {
            XCTFail("Ocorreu um problema na requisição")
        }
        waitForExpectations(timeout: 15, handler: nil)
    }*/
}
