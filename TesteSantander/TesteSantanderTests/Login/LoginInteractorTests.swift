//
//  LoginInteractorTests.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class LoginInteractorTests: XCTestCase {
    // MARK: Subject under test
  
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
        
        override func performLogin(request: LoginModel.Login.Request) {
            loginPresentationLogic.presentLoginError(error: "erro")
        }
    }
  
    class LoginPresentationLogicSpy: LoginPresentationLogic {
        var presentLoginIsCalled = false
        var presentLoginErrorIsCalled = false
        var getLastUsernameIsCalled = false
        
        func presentLogin(response: LoginModel.Login.Response) {
            presentLoginIsCalled = true
        }
        
        func presentLoginError(error: String) {
            presentLoginErrorIsCalled = true
        }
        
        func getLastUsername(username: String) {
            getLastUsernameIsCalled = true
        }
    }

    // MARK: Tests
    
    func testPerformLogin() {
        let loginWorkerSpy = LoginWorkerSpy()
        sut.worker = loginWorkerSpy
        
        sut.performLogin(request: LoginModel.Login.Request(user: "teste@teste.com", password: "Teste@1"))
        
        XCTAssertTrue(loginWorkerSpy.loginPresentationLogic.presentLoginIsCalled)
    }
    
    func testPerformLoginError() {
        let interactorSpy = LoginInteractorSpy()
        
        interactorSpy.performLogin(request: LoginModel.Login.Request(user: "teste.com", password: "Teste"))
        
        XCTAssertTrue(interactorSpy.loginPresentationLogic.presentLoginErrorIsCalled)
    }
    
    func testGetLastUsername() {
        let loginPresentSpy = LoginPresentationLogicSpy()
        sut.presenter = loginPresentSpy
        
        sut.getLastUserName()
        XCTAssertTrue(loginPresentSpy.getLastUsernameIsCalled)
    }
}
