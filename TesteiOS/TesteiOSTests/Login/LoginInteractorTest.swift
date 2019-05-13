//
//  LoginInteractorTest.swift
//  TesteiOSTests
//
//  Created by Fabio Souza de Morais on 13/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest

@testable import TesteiOS

class LoginInteractorTest: XCTestCase {

    var sut: LoginInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupLoginInteractor()
    }
    
    // MARK: Test setup
    
    func setupLoginInteractor() {
        sut = LoginInteractor()
    }
    
    // MARK: Spy class
    
    class LoginWorkerSpy: LoginWorker {
        let loginPresentationLogic = LoginPresentationLogicSpy()
        
        override func login(requestData: LoginModel.Login.Request, completionSuccess: @escaping LoginResponseSuccess, completionFailure: @escaping LoginResponseFailure) {
            let response = LoginModel.Login.Response(user: nil)
            loginPresentationLogic.presentLogin(response: response)
        }
    }
    
    class LoginInteractorSpy: LoginInteractor {
        let loginPresentationLogic = LoginPresentationLogicSpy()
        
        override func postLogin(request: LoginModel.Login.Request) {
            loginPresentationLogic.showAlertError(error: "error")
        }
    }
    
    class LoginPresentationLogicSpy: LoginPresentationLogic {
        var presentLoginIsCalled = false
        var presentSavedUsernameIsCalled = false
        var presentLoginError = false
        
        func getSavedUserName(userName: String) {
            presentSavedUsernameIsCalled = true
        }
        
        func presentLogin(response: LoginModel.Login.Response) {
            presentLoginIsCalled = true
        }
        
        func showAlertError(error: String) {
            presentLoginError = true
        }
    }
    
    // MARK: Tests
    
    func testPerformLogin() {
        let loginWorkerSpy = LoginWorkerSpy()
        sut.worker = loginWorkerSpy
        
        sut.postLogin(request: LoginModel.Login.Request(userId: "teste@teste.com", password: "Teste@1"))
        
        XCTAssertTrue(loginWorkerSpy.loginPresentationLogic.presentLoginIsCalled)
    }
    
    func testPerformLoginError() {
        let interactorSpy = LoginInteractorSpy()
        
        interactorSpy.postLogin(request: LoginModel.Login.Request(userId: "teste.com", password: "Teste"))
        
        XCTAssertTrue(interactorSpy.loginPresentationLogic.presentLoginError)
    }
    
    func testGetLastUsername() {
        let loginPresentSpy = LoginPresentationLogicSpy()
        sut.presenter = loginPresentSpy
        
        sut.getSavedUserName()
        XCTAssertTrue(loginPresentSpy.presentSavedUsernameIsCalled)
    }
}
