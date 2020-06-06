//
//  UserNameValidator.swift
//  ValidatorTests
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import XCTest
@testable import Validator
import Presenter

class UserNameValidator: XCTestCase {

    func testEmailValid() throws {
        //Given
        let sut = UserNameValidate()
        
        //When
        let emailValid = "invalid_email@provider.com"
        
        //Then
        XCTAssertTrue(sut.isValid(userName: emailValid))
    }
    
    func testEmailInvalid() throws {
        //Given
        let sut = UserNameValidate()
        
        //When
        let emailInvalid = "invalid_email#provider.com"
        
        //Then
        XCTAssertFalse(sut.isValid(userName: emailInvalid))
    }
    
    func testCPFValid() throws {
        //Given
        let sut = UserNameValidate()
        
        //When
        let cpfValid = "18962206064"
        
        //Then
        XCTAssertTrue(sut.isValid(userName: cpfValid))
    }
    
    func testCPFInvalid() throws {
        //Given
        let sut = UserNameValidate()
        
        //When
        let cpfInvalid = "12345678901"
        
        //Then
        XCTAssertFalse(sut.isValid(userName: cpfInvalid))
    }
}
