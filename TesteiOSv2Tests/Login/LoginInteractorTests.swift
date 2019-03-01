//
//  LoginInteractorTests.swift
//  TesteiOSv2Tests
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class LoginInteractorTests: XCTestCase {
    
    var interactor: LoginInteractor!
    
    override func setUp() {
        interactor = LoginInteractor()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCredentialsValidationChain(){
        let workerSpy = LoginWorkerSpy()
        interactor.worker = workerSpy
        interactor.validateCredentials(credentialsRequest: Login.CredentialsValidation.Request(username: "marcel.mendes@accenture.com", password: "A1$"))
        
        XCTAssertTrue(workerSpy.validateCredentialsCalled)
    }
    
    func testUsernameRetrievalChain(){
        let presenterSpy = LoginPresenterSpy()
        interactor.presenter = presenterSpy
        interactor.retrieveLastUserLogin(request: Login.LastUserLogin.Request())

        XCTAssertTrue(presenterSpy.prefillUsernameCalled)
    }
    
    class LoginWorkerSpy: LoginWorker
    {
        var validateCredentialsCalled = false
        
        override func validateCredentials(username: String, password: String, completionResult: @escaping (UserAccountModel?, Bool) -> Void) {
            validateCredentialsCalled = true
            completionResult(nil, true)
        }
    }
    
    class LoginPresenterSpy: LoginPresenter{
        var prefillUsernameCalled = false
        
        override func prefillUsername(response: Login.LastUserLogin.Response){
            prefillUsernameCalled = true
        }
    }
    
}
