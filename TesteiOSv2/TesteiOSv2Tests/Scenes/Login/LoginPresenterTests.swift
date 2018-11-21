//
//  LoginPresenterTests.swift
//  TesteiOSv2Tests
//
//  Created by Felipe perius on 21/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//
@testable import TesteiOSv2
import XCTest
import ObjectMapper

class LoginPresenterTests: XCTestCase {

    var presenter: LoginPresenter!
    
    // MARK: Test lifecycle
    override func setUp() {
        super.setUp()
        setupLoginPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    func setupLoginPresenter() {
        presenter = LoginPresenter()
    }

    
    class LoginPresenterOutputSpy: LoginPresenterOutput {
        var displayLoginErrorMessageCalled = false
        var displaySuccessfullLoginCalled = false
        
        func displaySuccessfullLogin(viewModel: Login.ViewModelSuccessfullLogin) {
            displaySuccessfullLoginCalled = true
        }
        
        func loadingView() {
            
        }
        func displayLoginErrorMessage(viewModel: Login.ViewModelFailedLogin) {
            displayLoginErrorMessageCalled = true
        }
    }
    
    // MARK: Tests
    
    func testSuccessLogin() {
        // Given
        let spy = LoginPresenterOutputSpy()
        presenter.viewController = spy
        let jsonDictionary: [String: Any] = ["userId": 1, "name": "John", "bankAccount": "120","agency": "300","balance":10.12]
        let user = Mapper<User>().map(JSON: jsonDictionary)
        let response = Login.Response(isError: false, message: nil, user: user)
        
        // When
        presenter.presentLoginSuccesfull(response: response)
        
        // Then
        XCTAssertTrue(spy.displaySuccessfullLoginCalled)
    }

}
