//
//  LoginFormPresernterTest.swift
//  TesteSantaderTests
//
//  Created by Bruno Chen on 10/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import TesteSantader
import Foundation

class LoginFormPresernterTest: XCTestCase {

    var loginFormPresenter: LoginFormPresenter! = nil
    
    override func setUp() {
        
        loginFormPresenter = LoginFormPresenter()
    }
    
    func testLoginFormPresenterOutputCalledViewController() {
        
        //Given
        let loginFormPresenterOutputSpy = LoginFormPresenterOutputSpy()
        loginFormPresenter.viewController = loginFormPresenterOutputSpy
        
        //When
        loginFormPresenter.presentLogin(response: LoginForm.Login.Response(success: false))
        
        //Then
        
        XCTAssertTrue(loginFormPresenterOutputSpy.displayLoginFormCalled)
    }
    
    func testLoginFormPresenterOutputViewModelData() {
        
        //Given
        let loginFormPresenterOutputSpy = LoginFormPresenterOutputSpy()
        loginFormPresenter.viewController = loginFormPresenterOutputSpy
        
        //When
        loginFormPresenter.presentLogin(response: LoginForm.Login.Response(success: true))
        
        //Then
        
        XCTAssertTrue(loginFormPresenterOutputSpy.loginFormViewModelData.success)
    }
    
    
}



// MARK: - LoginForm Presenter Output Spy

class  LoginFormPresenterOutputSpy: LoginFormDisplayLogic {
    
    func displayExistentUser(userID: String?, password: String?) {
        
    }
    
    
    var displayLoginFormCalled = false
    
    var loginFormViewModelData: LoginForm.Login.ViewModel!
    
    func displayLogin(viewModel: LoginForm.Login.ViewModel) {
        displayLoginFormCalled = true
        loginFormViewModelData = viewModel
    }
    
    func login() {
        
    }
    
}
