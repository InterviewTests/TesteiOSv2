//
//  BankWorker.swift
//  TesteiOSV2_Rafael_HiedaTests
//
//  Created by Rafael  Hieda on 10/27/18.
//  Copyright © 2018 Rafael Hieda. All rights reserved.
//

import XCTest
import Alamofire
import AlamofireObjectMapper
@testable import TesteiOSV2_Rafael_Hieda

class BankAPIWorkerTestCase: XCTestCase {
    
    private var baseUrl: String = ""
    var userLogin : UserLogin?
    
    override func setUp() {
        super.setUp()
        baseUrl = "https://bank-app-test.herokuapp.com/api/"
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Should_Return_Success_When_Logging()
    {
        let e = expectation(description: "LoginTest")
        
        let url: String = baseUrl.description + "login"
        
        userLogin = UserLogin("test_user", password: "Test@1")
        
        let parameters : Parameters = ["user" : userLogin!.login, "password" : userLogin!.password]
        
        var userResponse: UserResponse?
        
        Alamofire.request(url, method: .post, parameters: parameters).responseObject { (response: DataResponse<UserResponse>) in
            userResponse = response.result.value
            
            XCTAssertNotNil(userResponse)
            XCTAssertEqual(userResponse?.userAccount?.userId, 1)
            XCTAssertEqual(userResponse?.userAccount?.agency, "012314564")
            XCTAssertEqual(userResponse?.userAccount?.bankAccount, "2050")
            XCTAssertEqual(userResponse?.userAccount?.name, "Jose da Silva Teste")
            XCTAssertEqual(userResponse?.userAccount?.balance, 3.3445)
            XCTAssertEqual(userResponse?.error?.Success(), true)
            
            e.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
        
        
    }
    
    //não há checagem do lado da API para validação de login e senha invalidas
    
//    func test_Should_Fail_If_Invalid_Login()
//    {
//        //Teste deveria funcionar, mas a API não valida email e senha.
//        let e = expectation(description: "LoginTest")
//
//        let url: String = baseUrl.description + "login"
//
//        userLogin = UserLogin("t", password: "Test@1")
//
//        let parameters : Parameters = ["user" : userLogin!.login, "password" : userLogin!.password]
//
//        var userResponse: UserResponse?
//
//        Alamofire.request(url, method: .post, parameters: parameters).responseObject { (response: DataResponse<UserResponse>) in
//            userResponse = response.result.value
//
//            XCTAssertNotNil(userResponse)
//            XCTAssertEqual(userResponse?.error?.Success(), false)
//
//            e.fulfill()
//        }
//
//        waitForExpectations(timeout: 10.0, handler: nil)
//    }
//
//    func test_Should_Fail_If_Invalid_Password()
//    {
//        let e = expectation(description: "LoginTest")
//
//        let url: String = baseUrl.description + "login"
//
//        userLogin = UserLogin("test_user", password: "sdasaasd")
//
//        let parameters : Parameters = ["user" : userLogin!.login, "password" : userLogin!.password]
//
//        var userResponse: UserResponse?
//
//        Alamofire.request(url, method: .post, parameters: parameters).responseObject { (response: DataResponse<UserResponse>) in
//            userResponse = response.result.value
//
//            XCTAssertNotNil(userResponse)
//            XCTAssertEqual(userResponse?.error?.Success(), false)
//
//            e.fulfill()
//        }
//
//        waitForExpectations(timeout: 10.0, handler: nil)
//    }
    
    
    func test_Should_Return_List_Of_Registry()
    {
        let e = expectation(description: "AccountBalance")
        let url: String = baseUrl.description + "statements/1"
        
        var balanceAccount : AccountBalance? = nil
        
        Alamofire.request(url)
            .responseObject {
                (dataResponse : DataResponse<AccountBalance>) in
                balanceAccount = dataResponse.result.value
                XCTAssertNotNil(balanceAccount)
                XCTAssertTrue((balanceAccount?.statementList?.count)! > 0)
                XCTAssertEqual(balanceAccount?.error?.Success(), true)
                e.fulfill()
        }
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
}
