//
//  AuthUserPresenterTests.swift
//  PresenterTests
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
import Domain
@testable import Presenter

class AuthUserPresenterTests: XCTestCase {

    func testAuthUserShowMessageErrorWhenPasswordDontInformated() throws {
        
        //Given
        let alertViewSpy = AlertViewSpy()
        let sut = createSutWith(alertViewSpy: alertViewSpy)
        let authUserViewModel = createAuthUserViewModel(password: nil)
        let alertViewModel = AlertViewModel(title: "Fail in auth the user", message: "The field Password is mandatory")
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(alertViewSpy.viewModel, alertViewModel)
    }
    
    func testAuthUserShowMessageErrorWhenUserNameDontInformated() throws {
        
        //Given
        let alertViewSpy = AlertViewSpy()
        let sut = createSutWith(alertViewSpy: alertViewSpy)
        let authUserViewModel = createAuthUserViewModel(userName: nil)
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
        let userNameValidateSpy = UserNameValidateSpy()
        let sut = createSutWith(userNameValidateSpy: userNameValidateSpy)
        let authUserViewModel = createAuthUserViewModel(userName: nil)
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(userNameValidateSpy.userName, authUserViewModel.userName)
    }
    
    func testShowErrorWhenInvalidUserName() throws {
        
        //Given
        let alertViewSpy = AlertViewSpy()
        let userNameValidateSpy = UserNameValidateSpy()
        let sut = createSutWith(alertViewSpy: alertViewSpy, userNameValidateSpy: userNameValidateSpy)
        let authUserViewModel = createAuthUserViewModel()
        let alertViewModel = AlertViewModel(title: "The field User Name is wrong", message: "You should put an email or cpf valid")
        
        //When
        userNameValidateSpy.makeInvalid()
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(alertViewSpy.viewModel, alertViewModel)
    }
    
    func testAuthUserWithAllValuesIformated() throws {
        
        //Given
        let authClientUseCaseSpy = AuthClientUseCaseSpy()
        let sut = createSutWith(authClientUseCaseSpy: authClientUseCaseSpy)
        let authUserViewModel = createAuthUserViewModel()
        let authClientModel = createAuthClientModel()
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(authClientUseCaseSpy.authClientModel, authClientModel)
    }
}

extension AuthUserPresenterTests {
    
    func createSutWith(
        authClientUseCaseSpy: AuthClientUseCaseSpy = AuthClientUseCaseSpy(),
        alertViewSpy: AlertViewSpy = AlertViewSpy(),
        userNameValidateSpy: UserNameValidateSpy = UserNameValidateSpy(),
        file: StaticString = #file,
        line: UInt = #line) -> AuthUserPresenter {
        let authUserPresenter = AuthUserPresenter(alertView: alertViewSpy, userNameValidate: userNameValidateSpy, authClientUseCase: authClientUseCaseSpy)
        memoryLeakCheckWith(instance: authUserPresenter)
        return authUserPresenter
    }
    
    func createAuthUserViewModel(userName: String? = "Test Name Drive", password: String? = "Passw1rd@dd") -> AuthUserViewModel {
        return .init(userName: userName, password: password)
    }
    
    func createAuthClientModel(user: String = "Test Name Drive", password: String = "Passw1rd@dd") -> AuthClientModel {
        return .init(user: user, password: password)
    }
}
