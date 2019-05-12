//
//  LoginPresenterTests.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class LoginPresenterTests: XCTestCase {
    // MARK: Subject under test
  
    var sut: LoginPresenter!
  
    // MARK: Test lifecycle
  
    override func setUp() {
        super.setUp()
        setupLoginPresenter()
    }
  
    // MARK: Test setup
  
    func setupLoginPresenter() {
        sut = LoginPresenter()
    }
  
    // MARK: Test spies
    
    class LoginDisplayLogicSpy: LoginDisplayLogic {
        var getDataIsCalled = false
        var displayErrorIsCalled = false
        var fillLastUsernameIsCalled = false
    
        func getData(viewModel: LoginModel.Login.ViewModel) {
            getDataIsCalled = true
        }

        func displayErrorAlert(error: String) {
            displayErrorIsCalled = true
        }

        func fillLastUsername(username: String) {
            fillLastUsernameIsCalled = true
        }
    }

    // MARK: Tests
    
    func testPresentLogin() {
        let viewControllerSpy = LoginDisplayLogicSpy()
        sut.viewController = viewControllerSpy
        let response = LoginModel.Login.Response(user: nil)
        
        sut.presentLogin(response: response)
        XCTAssertTrue(viewControllerSpy.getDataIsCalled)
    }
    
    func testPresentLoginError() {
        let viewControllerSpy = LoginDisplayLogicSpy()
        sut.viewController = viewControllerSpy
        
        sut.presentLoginError(error: "erro")
        XCTAssertTrue(viewControllerSpy.displayErrorIsCalled)
    }
    
    func testGetUsername() {
        let viewControllerSpy = LoginDisplayLogicSpy()
        sut.viewController = viewControllerSpy
        
        sut.getLastUsername(username: "teste@teste.com")
        XCTAssertTrue(viewControllerSpy.fillLastUsernameIsCalled)
    }
}
