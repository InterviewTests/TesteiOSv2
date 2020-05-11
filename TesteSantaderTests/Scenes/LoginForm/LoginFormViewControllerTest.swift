//
//  LoginFormViewControllerTest.swift
//  TesteSantaderTests
//
//  Created by Bruno Chen on 10/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import TesteSantader
import Foundation

class LoginFormViewControllerTest: XCTestCase {

    var loginFormViewController: LoginFormViewController!
    
    override func setUp() {
         
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        loginFormViewController =  storyboard.instantiateViewController(identifier: "LoginFormViewController")
        loginFormViewController.loadViewIfNeeded()
        loginFormViewController.viewDidLoad()
    }
    
    func testDisplayLoginFormShoudDisplayOtherViewController() {
        
        //Given
        let viewModel = LoginForm.Login.ViewModel(success: false)
        
        //When
        loginFormViewController.displayLogin(viewModel: viewModel)
        
        //Then
        XCTAssertEqual(loginFormViewController.passwordTextField.text, "")
        XCTAssertEqual(loginFormViewController.passwordTextField.text, "")
        
    }
    
    func testDisplayLoginFormShoudPassRequestoToInteractor() {
        
        //Given
        let interactorMock = LoginFormInteractorMock()
        loginFormViewController.interactor = interactorMock
        
        //When
        loginFormViewController.login()
        
        //Then
        XCTAssertTrue(interactorMock.interacterCalled)
    }
    
}

// MARK: - Login Form View Controller Output Spy

class LoginFormViewControllerOutputSpy: LoginFormBusinessLogic {
    
    func verifyExistentUser() {
        
    }
    
    
    var loginCalled = false
    
    var loginFormRequest: LoginForm.Login.Request!
    
    func login(request: LoginForm.Login.Request) {
        loginCalled = true
        loginFormRequest = request
    }
    
}

// MARK: - LoginForm Interactor Mock

class LoginFormInteractorMock: LoginFormBusinessLogic {

    var interacterCalled = false
    
    func login(request: LoginForm.Login.Request) {
        interacterCalled = true
    }
    
    func verifyExistentUser() {
        
    }

}
