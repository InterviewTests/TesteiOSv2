//
//  UserLoginTestCase.swift
//  TesteiOSV2_Rafael_HiedaTests
//
//  Created by Rafael  Hieda on 10/28/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import XCTest
@testable import TesteiOSV2_Rafael_Hieda

class UserLoginTestCase: XCTestCase {
    
    var userLogin : UserLogin?
    var expected : Bool?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_password_Has_Capital_Letters()
    {
        userLogin = UserLogin("teste", password: "@Teste123")
        expected = true
        XCTAssertEqual(userLogin?.passwordHasCapitalLetters(), expected)
    }
    
    func test_password_Does_Not_Have_Capital_Letters()
    {
        userLogin = UserLogin("teste", password: "@teste123")
        expected = false
        XCTAssertEqual(userLogin?.passwordHasCapitalLetters(), expected)
    }
    
    func test_password_Has_Numbers()
    {
        userLogin = UserLogin("teste", password: "@Teste123")
        expected = true
        XCTAssertEqual(userLogin?.passwordHasNumbers(), expected)
    }
    
    func test_password_Does_Not_Have_Numbers()
    {
        userLogin = UserLogin("teste", password: "@TesteOneTwoThree")
        expected = false
        XCTAssertEqual(userLogin?.passwordHasNumbers(), expected)
    }
    
    func test_password_Has_Special_Characters()
    {
        userLogin = UserLogin("teste", password: "@Teste123")
        expected = true
        XCTAssertEqual(userLogin?.passwordHasSpecialCharacters(), expected)
    }
    
    func test_password_Does_Not_Have_Special_Characters()
    {
        userLogin = UserLogin("teste", password: "AtTeste123")
        expected = false
        XCTAssertEqual(userLogin?.passwordHasSpecialCharacters(), expected)
    }
    

    
}
