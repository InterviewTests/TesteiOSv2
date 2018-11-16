//
//  LoginTest.swift
//  TesteiOSv2Tests
//
//  Created by Macintosh on 15/11/18.
//  Copyright © 2018 Roney Sampaio. All rights reserved.
//

import XCTest
@testable import TesteiOSv2
@testable import Alamofire


class LoginTest: XCTestCase {
    
    var loginRequest: Login.Request!
    var loginResponse: Login.Response!
    var interactor: LoginInteractor!
    
    

    override func setUp() {
        interactor = LoginInteractor()
    }
    
    
    // MARK: Models
    func testModel () {
        loginRequest = Login.Request(userID: "userID", password: "password")
        
        let userAccount: [String: Any] = ["one": 1, "two":2]
        loginResponse = Login.Response(response: ["userAccount": userAccount, "error":[]])
    }
    

    // MARK: Invalid Login
    func testForFailLogin()
    {
        
        let request = Login.Request(userID: "user", password: "pass")
        
        XCTAssertTrue(interactor?.loginData == nil)

        interactor.login(request: request)
        
        sleep(5)

        XCTAssertTrue(interactor?.loginData == nil, "User not valid")
    }
    
    
    // MARK: Valid Login
    func testForSuccessLogin()
    {
        
        let request = Login.Request(userID: "user@user.com", password: "Aa@")
        
        XCTAssertTrue(interactor?.loginData == nil)
        
        interactor.login(request: request)
        
        sleep(5)
        
        XCTAssertTrue(interactor?.loginData != nil, "User is valid")
    }
    

    override func tearDown() {
        loginRequest = nil
        interactor = nil
    }

}
