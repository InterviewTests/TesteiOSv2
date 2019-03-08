//
//  BankAPITest.swift
//  BankTests
//
//  Created by Administrador on 07/03/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest
@testable import Bank

class BankAPITest: XCTestCase {
    
    var bankAPI: BankAPI!

    override func setUp() {
        super.setUp()
        bankAPI = BankAPI()
    }

    override func tearDown() {
        bankAPI = nil
        super.tearDown()
    }
    
    func testAuthenticate() {
        let promise = expectation(description: "Autenticathion Success")
        do {
            try bankAPI.authenticate(user: "teste@teste.com", password: "Test@1") { (user, error) in
                if user != nil {
                    promise.fulfill()
                }
                else
                {
                    XCTFail("Ocorreu um problema na autenticação")
                }
            }
        } catch {
            XCTFail("Ocorreu um problema na autenticação")
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
    func testAuthenticateFailed() {
        let promise = expectation(description: "Autenticathion Failed")
        do {
            try bankAPI.authenticate(user: "", password: "") { (user, error) in
                if user == nil && error != nil{
                    promise.fulfill()
                }
                else
                {
                    XCTFail("Ocorreu um problema na autenticação")
                }
            }
        } catch {
            XCTFail("Ocorreu um problema na autenticação")
        }
        waitForExpectations(timeout: 15, handler: nil)
    }
    
}
