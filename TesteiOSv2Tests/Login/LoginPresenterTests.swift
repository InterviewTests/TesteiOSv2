//
//  LoginPresenterTests.swift
//  TesteiOSv2Tests
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class LoginPresenterTests: XCTestCase {
    
    var presenter: LoginPresenter!
    
    override func setUp() {
        presenter = LoginPresenter()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrefillUsername(){
        let loginViewControllerSpy = LoginViewControllerSpy()
        presenter.viewController = loginViewControllerSpy
        presenter.prefillUsername(response: Login.LastUserLogin.Response(username: "marcel.mendes@gmail.com"))
        
        XCTAssertTrue(loginViewControllerSpy.setUsernameTextFieldCalled)
    }
    
    func testDisplayInvalidUserErrorMessage(){
        let loginViewControllerSpy = LoginViewControllerSpy()
        presenter.viewController = loginViewControllerSpy
        
        var response = Login.CredentialsValidation.Response()
        response.isUsernameValid = false
        response.isPasswordValid = true
        response.areCredentialsValid = true
        presenter.processResult(response: response)
        
        XCTAssertTrue(loginViewControllerSpy.displayInvalidUserErrorMessageSuccessful)
    }

    func testDisplayInvalidPasswordErrorMessage(){
        let loginViewControllerSpy = LoginViewControllerSpy()
        presenter.viewController = loginViewControllerSpy
        
        var response = Login.CredentialsValidation.Response()
        response.isUsernameValid = true
        response.isPasswordValid = false
        response.areCredentialsValid = false
        presenter.processResult(response: response)
        
        XCTAssertTrue(loginViewControllerSpy.displayInvalidPasswordErrorMessageSuccessful)
    }

    func testDisplayInvalidCredentialsErrorMessage(){
        let loginViewControllerSpy = LoginViewControllerSpy()
        presenter.viewController = loginViewControllerSpy
        
        var response = Login.CredentialsValidation.Response()
        response.isUsernameValid = true
        response.isPasswordValid = true
        response.areCredentialsValid = false
        presenter.processResult(response: response)
        
        XCTAssertTrue(loginViewControllerSpy.displayInvalidCredentialsErrorMessageSuccessful)
    }
    
    func testFinishedCredentialsValidation(){
        let loginViewControllerSpy = LoginViewControllerSpy()
        presenter.viewController = loginViewControllerSpy
        
        var response = Login.CredentialsValidation.Response()
        response.isUsernameValid = true
        response.isPasswordValid = true
        response.areCredentialsValid = true
        
        if let mockData = mock(jsonFile: "userAccount"){
            let userAccount = UserAccountModel(data: mockData)
            response.userAccount = userAccount
            presenter.processResult(response: response)
            XCTAssertTrue(loginViewControllerSpy.hasValidUserAccount)
        } else {
            XCTFail()
        }
    }
    
    class LoginViewControllerSpy: LoginViewController{
        var setUsernameTextFieldCalled = false
        var displayInvalidUserErrorMessageSuccessful = false
        var displayInvalidPasswordErrorMessageSuccessful = false
        var displayInvalidCredentialsErrorMessageSuccessful = false
        var hasValidUserAccount = false
        
        override func setUsernameTextField(viewModel: Login.LastUserLogin.ViewModel) {
            setUsernameTextFieldCalled = true
        }

        override func displayInvalidUserErrorMessage(viewModel: Login.CredentialsValidation.ViewModel) {
            if let userMessage = viewModel.userMessage, userMessage == Constants.Login.usernameDoesntMatchRequirements{
                displayInvalidUserErrorMessageSuccessful = true
            }
        }

        override func displayInvalidPasswordErrorMessage(viewModel: Login.CredentialsValidation.ViewModel) {
            if let userMessage = viewModel.userMessage, userMessage == Constants.Login.passwordDoesntMatchRequirements{
                displayInvalidPasswordErrorMessageSuccessful = true
            }
        }

        override func displayInvalidCredentials(viewModel: Login.CredentialsValidation.ViewModel) {
            if let userMessage = viewModel.userMessage, userMessage == Constants.Login.credentialsNotValid{
                displayInvalidCredentialsErrorMessageSuccessful = true
            }
        }

        override func finishedCredentialsValidation(response: Login.CredentialsValidation.Response) {
            hasValidUserAccount = (response.userAccount != nil) && response.areCredentialsValid && response.isPasswordValid && response.isUsernameValid
        }
    }
    
    private func mock(jsonFile: String) -> Data? {
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
            let url = URL(fileURLWithPath: path)
            guard let data = try? Data(contentsOf: url) else {
                fatalError("Error parse json to Data")
            }
            return data
        } else {
            return nil
        }
    }


    
}
