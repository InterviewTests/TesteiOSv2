//
//  LoginViewControllerTests.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class LoginViewControllerTests: XCTestCase {
  // MARK: Subject under test
  
    var sut: LoginViewController!
    var window: UIWindow!
  
    // MARK: Test lifecycle
  
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupLoginViewController()
    }

    // MARK: Test setup
    
    func setupLoginViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
    }

    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test spies

    class LoginBusinessLogicSpy: LoginBusinessLogic {
        var performLoginIsCalled = false
        var getLastUsernameIsCalled = false
        
        func performLogin(request: LoginModel.Login.Request) {
            performLoginIsCalled = true
        }
        
        func getLastUserName() {
            getLastUsernameIsCalled = true
        }
    }

    // MARK: Tests
    
    func testperformLogin() {
        // Given
        let spy = LoginBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.performLogin()
        
        // Then
        XCTAssertTrue(spy.performLoginIsCalled)
    }
    
    func testGetLastUsername() {
        // Given
        let spy = LoginBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.getLastUsername()
        
        // Then
        XCTAssertTrue(spy.getLastUsernameIsCalled)
    }
    
    func testFillUsername() {
        // When
        loadView()
        sut.fillLastUsername(username: "teste@teste.com")
        
        //Then
        XCTAssertEqual(sut.userTextField.text, "teste@teste.com")
    }
}
