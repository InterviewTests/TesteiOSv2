//
//  PresenterTests.swift
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
        let (sut, alertViewSpy) = createSut()
        let authUserViewModel = AuthUserViewModel(nameUser: "Test Name Drive", password: nil)
        let alertViewModel = AlertViewModel(title: "Fail in auth the user", message: "The field Password is mandatory")
        
        //When
        sut.auth(viewModel: authUserViewModel)
        
        //Then
        XCTAssertEqual(alertViewSpy.viewModel, alertViewModel)
    }
    
    func testAuthUserShowMessageErrorWhenUserNameDontInformated() throws {
        
        //Given
        let (sut, alertViewSpy) = createSut()
        let authUserViewModel = AuthUserViewModel(nameUser: nil, password: "password@dd")
        let alertViewModel = AlertViewModel(title: "Fail in auth the user", message: "The field Name User is mandatory")
        
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
}

extension AuthUserPresenterTests {
    
    func createSut(file: StaticString = #file, line: UInt = #line) -> (sut: AuthUserPresenter, spy: AlertViewSpy) {
        let spy = AlertViewSpy()
        let sut = AuthUserPresenter(alertView: spy)
        memoryLeakCheckWith(instance: sut)
        return (sut, spy)
    }
}
