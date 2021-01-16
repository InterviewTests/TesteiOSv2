//
//  PasswordValidationTests.swift
//  BankAppTests
//
//  Created by Bruno Maciel on 1/16/21.
//

import XCTest
@testable import BankApp

class PasswordValidationTests: XCTestCase {

    let interactor = LoginInteractor()
    let minNumCharacter = 8
    let failValidationMessage = """
        Senha deve conter:
        Ao menos 8 caracteres,
        um número, uma letra maiúscula e um caracter especial -@#$%^&*.
        """

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // MARK: - Validation MUST FAIL
    
    func test_validatePassword_nilUsername() {
        let nilPassword: String? = nil
        
        XCTAssertThrowsError(try interactor.validatePassword(nilPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.blankPassword)
        }
    }
    
    func test_validatePassword_emptyUsername() {
        let emptyPassword: String? = ""
        
        XCTAssertThrowsError(try interactor.validatePassword(emptyPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.blankPassword)
        }
    }
    
    func test_validatePassword_onlyNumbersPassword() {
        let onlyNumbersPassword = "12345678"
        
        XCTAssert(onlyNumbersPassword.count >= minNumCharacter)
        XCTAssertThrowsError(try interactor.validatePassword(onlyNumbersPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlyUppercasedPassword() {
        let onlyUppercasedPassword = "QWERASDF"
        
        XCTAssert(onlyUppercasedPassword.count >= minNumCharacter)
        XCTAssertThrowsError(try interactor.validatePassword(onlyUppercasedPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlyLowercasedPassword() {
        let onlyLowercasedPassword = "qweradsf"
        
        XCTAssert(onlyLowercasedPassword.count >= minNumCharacter)
        XCTAssertThrowsError(try interactor.validatePassword(onlyLowercasedPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlySpecialCharacters() {
        let onlySpecialCharacters = "@#$%^&*@"
        
        XCTAssert(onlySpecialCharacters.count >= minNumCharacter)
        XCTAssertThrowsError(try interactor.validatePassword(onlySpecialCharacters)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlyNumbersAndUppercasedPassword() {
        let onlyNumbersAndUppercasedPassword = "1234QWER"
        
        XCTAssert(onlyNumbersAndUppercasedPassword.count >= minNumCharacter)
        XCTAssertThrowsError(try interactor.validatePassword(onlyNumbersAndUppercasedPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlyNumbersAndSpecialCharPassword() {
        let onlyNumbersAndSpecialCharPassword = "1234%^&*@"
        
        XCTAssert(onlyNumbersAndSpecialCharPassword.count >= minNumCharacter)
        XCTAssertThrowsError(try interactor.validatePassword(onlyNumbersAndSpecialCharPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_onlyUppercasedAndSpecialCharPassword() {
        let onlyUppercasedAndSpecialCharPassword = "QWER%^&*@"
        
        XCTAssert(onlyUppercasedAndSpecialCharPassword.count >= minNumCharacter)
        XCTAssertThrowsError(try interactor.validatePassword(onlyUppercasedAndSpecialCharPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    func test_validatePassword_lessThanMinimumSizePassword() {
        let lessThanMinimumSizePassword = "12QW&-"
        
        XCTAssert(lessThanMinimumSizePassword.count < minNumCharacter)
        XCTAssertThrowsError(try interactor.validatePassword(lessThanMinimumSizePassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidPassword(message: failValidationMessage))
        }
    }
    
    
    // MARK: - Validation MUST SUCCEED
    
    func test_validatePassword_oneUppercased_OneNumber_OneSpecialChar() {
        let oneUppercased_OneNumber_OneSpecialChar = "1Q-poiuy"
        
        XCTAssert(oneUppercased_OneNumber_OneSpecialChar.count >= minNumCharacter)
        XCTAssertNoThrow(try interactor.validatePassword(oneUppercased_OneNumber_OneSpecialChar))
    }

}
