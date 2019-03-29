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
    var userAccount: UserAccount?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loginInteractor = LoginInteractor()
        promise = expectation(description: "Request")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    class LoginPresenterSpy: LoginPresentationLogic {
        var objectTest: LoginTests?
        
        // MARK: Spied methods
        func presentUserLogged(_ user: UserAccount?, _ error: Error?) {
            objectTest?.userAccount = user
            objectTest?.promise.fulfill()
        }
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

        let presenterSpy = LoginPresenterSpy()
        presenterSpy.objectTest = self
        loginInteractor.presenter = presenterSpy
        
        loginInteractor.login(user, password)
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(self.userAccount?.userId, expected.userId, "userId diferente")
        XCTAssertEqual(self.userAccount?.name, expected.name, "name diferente")
        XCTAssertEqual(self.userAccount?.bankAccount, expected.bankAccount, "bankAccount diferente")
        XCTAssertEqual(self.userAccount?.agency, expected.agency, "agency diferente")
        XCTAssertEqual(self.userAccount?.balance, expected.balance, "balance diferente")
    }
}
