//
//  LoginTests.swift
//  DesafioSantanderTests
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import XCTest
@testable import DesafioSantander

class LoginTests: XCTestCase {
    
    var loginInteractor: LoginInteractor!
    var promise: XCTestExpectation!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginInteractor = LoginInteractor()
        promise = expectation(description: "Request")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWhenUserPassLoginAndPasswordReturnsLoggedUser() {
        
        let user = "teste@teste.com"
        let password = "Test@1"

        var expected = UserAccount()
        expected.userId = 1
        expected.name = "Jose da Silva Teste"
        expected.bankAccount = "2050"
        expected.agency = "012314564"
        expected.balance = 3.3445

        
        loginInteractor.login(user, password) { [unowned self] (userAccount, error) in
            XCTAssertNil(error)

            XCTAssertEqual(userAccount?.userId, expected.userId, "userId diferente")
            XCTAssertEqual(userAccount?.name, expected.name, "name diferente")
            XCTAssertEqual(userAccount?.bankAccount, expected.bankAccount, "bankAccount diferente")
            XCTAssertEqual(userAccount?.agency, expected.agency, "agency diferente")
            XCTAssertEqual(userAccount?.balance, expected.balance, "balance diferente")
            
            self.promise.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
