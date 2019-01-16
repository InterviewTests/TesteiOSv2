//
//  TesteiOSv2Tests.swift
//  TesteiOSv2Tests
//
//  Created by Alex Nunes da Silva on 12/01/19.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import XCTest


@testable import TesteiOSv2

class TesteiOSv2Tests: XCTestCase {

    var worker : LoginWorker!

    override func setUp() {
        self.worker = LoginWorker()
    }

    func testLoginSuccessRequest() {

        var userAccount : UserModel?

        let loginWorkerExpectation = expectation(description: "Request login Sucesso!!")

        let login =  Login.LoginLoad.Request.Login(login: "test_user", senha: "Test@1")
        self.worker.sendLogin(login: login, completion: { response in
            //..
            print("Sucesso!!")
            userAccount = response
            loginWorkerExpectation.fulfill()

        }) { error in
            //..
            print("erros")
        }

        waitForExpectations(timeout: 2.0)
        XCTAssertNotNil(userAccount, "login loaded")
        XCTAssertEqual(userAccount?.userAccount?.name, "Jose da Silva Teste")

    }

    func testloginFailureRequest() {
        let loginWorkerExpectation = expectation(description: "Request login error!!")
        let login =  Login.LoginLoad.Request.Login(login: "test_user", senha: "Test@1")
        self.worker.sendLogin(login: login, completion: { response in
            //...
        }) { fail in
            XCTAssertNotNil(fail, "Ocorreu um erro")
            loginWorkerExpectation.fulfill()
        }
        waitForExpectations(timeout: 2.0)

    }


    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
