//
//  LoginTestCase.swift
//  TesteiOSv2Tests
//
//  Created by Felipe perius on 21/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//
@testable import TesteiOSv2
import XCTest
class LoginTestCase: XCTestCase {
    
    var expected : Bool?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_password_alphanumertic()
    {
        let loginModel = Login.Request.init(userName:"T@1233aaa", password:"asf1asf")
        expected = true
        XCTAssertEqual(loginModel.password!.isAlphanumeric, expected)
    }
    
    func test_password_capital_letters()
    {
        let loginModel = Login.Request.init(userName:"T@1233aaa", password:"asfasf")
        expected = true
        XCTAssertEqual(loginModel.password!.isCapitalLetter, expected)
    }
    
    func test_password_not_have_special_characters()
    {
        let loginModel = Login.Request.init(userName:"T@1233aaa", password:"asf1asf")
        expected = false
        XCTAssertEqual(loginModel.password!.isSpecialCharacter, expected)
    }
    
    func test_invalid_email()
    {
        let loginModel = Login.Request.init(userName:"aaaaa", password:"asf1asf")
        expected = false
        XCTAssertEqual(loginModel.userName!.isValidEmail, expected)
    }
    
    func test_password_valid(){
        let loginModel = Login.Request.init(userName:"aaaaa", password:"T@1233aaa")
        expected = false
        XCTAssertEqual(loginModel.password!.isPasswordValid(), expected)
    }
    
    func test_password_invalid(){
        let loginModel = Login.Request.init(userName:"aaaaa", password:"asfjasjf")
        expected = true
        XCTAssertEqual(loginModel.password!.isPasswordValid(), expected)
    }
    
    
    func test_valid_email()
    {
        let loginModel = Login.Request.init(userName:"teste@gmail.com", password:"F@1f1asf")
        expected = true
        XCTAssertEqual(loginModel.userName!.isValidEmail, expected)
    }
    
    func test_invalid_CPF()
    {
        let loginModel = Login.Request.init(userName:"7126471824", password:"asf1asf")
        expected = false
        XCTAssertEqual(loginModel.userName!.isValidCPF, expected)
    }
    
    func test_valid_CPF()
    {
        let loginModel = Login.Request.init(userName:"346.240.314-15", password:"F@124124")
        expected = true
        XCTAssertEqual(loginModel.userName!.isValidCPF, expected)
    }

}
