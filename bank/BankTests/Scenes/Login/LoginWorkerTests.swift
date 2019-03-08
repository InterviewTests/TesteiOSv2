//
//  LoginWorkerTests.swift
//  BankTests
//
//  Created by Administrador on 08/03/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest
@testable import Bank

class LoginWorkerTests: XCTestCase {

    var loginWorker: LoginWorker!
    
    override func setUp() {
        super.setUp()
        loginWorker = LoginWorker(bankStore: BankAPI())
    }

    override func tearDown() {
        loginWorker = nil
        super.tearDown()
    }
    
    func testAuthenticate() {
        let promise = expectation(description: "Autenticathion Success")
        loginWorker.authenticate(user: "teste@teste.com", password: "Test@1") { (user, error) in
            if user != nil {
                promise.fulfill()
            }
            else
            {
                XCTFail("Ocorreu um problema na autenticação")
            }
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testAuthenticateFailed() {
        let promise = expectation(description: "Autenticathion Failed")
        loginWorker.authenticate(user: "", password: "") { (user, error) in
            if user == nil && error != nil{
                promise.fulfill()
            }
            else
            {
                XCTFail("Ocorreu um problema na autenticação")
            }
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
}
