//
//  LoginFormInteractorTest.swift
//  TesteSantaderTests
//
//  Created by Bruno Chen on 10/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import TesteSantader
import Foundation

class LoginFormInteractorTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func testSetupLoginFormInteractor() {
        _ = LoginFormInteractor()
    }

    // MARK: - Test login
    
    func testLoginFormBusinessLogicGetOutputOfStoryboard() {
        let loginFormInteractor = LoginFormInteractor()
        
        //Given
        let loginFormInteractorOutputSpy = LoginFormInteractorOutputSpy()
        loginFormInteractor.presenter = loginFormInteractorOutputSpy
        
        let request = LoginForm.Login.Request(userID: "", password: "")
        
        //When
        loginFormInteractor.login(request: request)
        
        //Then
        
        XCTAssertTrue(loginFormInteractorOutputSpy.presentLogiCalled, "Verify if present is called")
    }
    
    // MARK: - Test user if stored
    
    func testUserDataReturnAllUserInformationToPresender() {
        let loginFormInteractor = LoginFormInteractor()
        let valitationWorker = ValitationWorkerMock()
        let bankApiWorker = BankAPIWorkerMock()
        
        //Given
        let allUserData: UserData = UserData(userAccount: UserAccount(userID: 10, name: "name", bankAccount: "bankAccount", agency: "agency", balance: 1.0), error: ErrorUserAPI())
        loginFormInteractor.valitationWorker = valitationWorker
        loginFormInteractor.bankApiWorker = bankApiWorker
        
        //When
        loginFormInteractor.login(request: LoginForm.Login.Request(userID: "", password: ""))
        let returnedUserData = loginFormInteractor.user
        
        //Then
        XCTAssertEqual(returnedUserData, allUserData, "User Data must be full")
    }
    
}

// MARK: - Presenter Mock

class LoginFormInteractorOutputSpy: LoginFormPresentationLogic {
    
    var presentLogiCalled = false
    
    func showExistentUser(userID: String, password: String) {
        presentLogiCalled = true
    }
    
    func presentLogin(response: LoginForm.Login.Response) {
        presentLogiCalled = true
    }
    
}

// MARK: - Valitation Worker Mock

class ValitationWorkerMock: valitationInputsWorkerProtocol {
    func isValidImputs(userStr: String?, passwordStr: String?) -> Bool {
        return true
    }
    
}

// MARK: - Bank API Worker Mock

class BankAPIWorkerMock: BankAPIWorkerProtocol {
    
    func fetchUser(userID: String, password: String, completionHandler: @escaping (UserData?) -> Void) {
        let allUserData: UserData = UserData(userAccount: UserAccount(userID: 10, name: "name", bankAccount: "bankAccount", agency: "agency", balance: 1.0), error: ErrorUserAPI())
        completionHandler(allUserData)
    }
    
    func fetchStatementList(userID: String, completionHandler: @escaping ([StatementList]) -> Void) {
        
    }
    
    
}

// MARK: - Keychain Mock

class KeychainMock: UserStoreProtocol {
    
    func fetchUser(userID: String, password: String, completionHandler: @escaping (UserData?, UserStoreError?) -> Void) {
    }
    
}
