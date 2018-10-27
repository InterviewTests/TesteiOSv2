//
//  UserResponseTestCase.swift
//  TesteiOSV2_Rafael_HiedaTests
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import XCTest
@testable import TesteiOSV2_Rafael_Hieda

class UserResponseTestCase: XCTestCase {
    
    var error : LoginError?
    var expected : Bool?
    
    override func setUp() {
        error = LoginError()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        error = nil
    }
    
    
    func test_Success_Should_Return_False_If_Fields_Filled_in()
    {
        error?.code = 53
        error?.message = "Usuário ou senha incorreta"
        expected = false
        XCTAssertEqual(error?.Success(), expected)
    }
    
    func test_Success_Should_Return_True_If_Fields_Not_Filled()
    {
        expected = true
        XCTAssertEqual(error?.Success(), expected)
    }
    
    func test_Success_Should_Return_False_If_Code_Not_Filled()
    {
        expected = false
        error?.message = "Invalid message"
        XCTAssertEqual(error?.Success(), expected)
    }
    
    func test_Success_Should_Return_False_If_Message_Not_Filled()
    {
        expected = false
        error?.code = 10
        XCTAssertEqual(error?.Success(), expected)
    }

    
}
