//
//  AuthUserPresenterTests.swift
//  PresenterTests
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
@testable import Presenter

class AuthUserPresenterTests: XCTestCase {

    func testAuthUserShowMessageErrorWhenPasswordDontInformated() throws {
        
        //Given
        let (sut, alertViewSpy, _) = createSut()
        let authUserViewModel = AuthUserViewModel(userName: "Test Name Drive", password: nil)
        let alertViewModel = AlertViewModel(title: "Fail in auth the user", message: "The field Password is mandatory")
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(alertViewSpy.viewModel, alertViewModel)
    }
    
    func testAuthUserShowMessageErrorWhenUserNameDontInformated() throws {
        
        //Given
        let (sut, alertViewSpy, _) = createSut()
        let authUserViewModel = AuthUserViewModel(userName: nil, password: "password@dd")
        let alertViewModel = AlertViewModel(title: "Fail in auth the user", message: "The field User Name is mandatory")
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(alertViewSpy.viewModel, alertViewModel)
    }
    
    func testFuncStringCheckWhenPutStringInvalid() throws {
        
        //Given
        let stringNil: String? = nil
        let stringEmpty: String = ""
        
        //When
        let isValid = false
        
        //Then
        XCTAssertEqual(isValid, StringCheck.isValidField(stringNil))
        XCTAssertEqual(isValid, StringCheck.isValidField(stringEmpty))
    }
    
    func testFuncStringCheckWhenPutStringValid() throws {
        
        //Given
        let stringValid: String = "stringValid"
        
        //When
        let isValid = true
        
        //Then
        XCTAssertEqual(isValid, StringCheck.isValidField(stringValid))
    }
    
    func testIfUserNameValidatorHasBeenCalled() throws {
        
        //Given
        let (sut, _, userNameValidatorSpy) = createSut()
        let authUserViewModel = AuthUserViewModel(userName: nil, password: "password@dd")
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(userNameValidatorSpy.userName, authUserViewModel.userName)
    }
    
    func testShowErrorWhenInvalidUserName() throws {
        
        //Given
        let (sut, alertViewSpy, userNameValidatorSpy) = createSut()
        let authUserViewModel = AuthUserViewModel(userName: "Test Name Drive", password: "password@dd")
        let alertViewModel = AlertViewModel(title: "The field User Name is wrong", message: "You should put an email or cpf valid")
        
        //When
        userNameValidatorSpy.isValid = false
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(alertViewSpy.viewModel, alertViewModel)
    }
}

extension AuthUserPresenterTests {
    
    func createSut(file: StaticString = #file, line: UInt = #line) -> (sut: AuthUserPresenter, alertViewSpy: AlertViewSpy, userNameValidateSpy: UserNameValidateSpy) {
        let alertViewSpy = AlertViewSpy()
        let userNameValidateSpy = UserNameValidateSpy()
        let sut = AuthUserPresenter(alertView: alertViewSpy, userNameValidate: userNameValidateSpy)
        memoryLeakCheckWith(instance: sut)
        return (sut, alertViewSpy, userNameValidateSpy)
    }
    
    class UserNameValidateSpy: UserNameValidateProtocol {
        var userName: String?
        var isValid = true
        
        func isValid(userName: String?) -> Bool {
            self.userName = userName
            return isValid
        }
    }
}
