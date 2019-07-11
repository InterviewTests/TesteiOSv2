//
//  TestSantanderTests.swift
//  TestSantanderTests
//
//  Created by ely.assumpcao.ndiaye on 07/06/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//
import Alamofire
import XCTest
@testable import TestSantander

class LoginSantanderTests: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: LoginInteractor!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        setupLoginInteractor()
        test_validatePassword()
        test_username_placeholder()
        RequestFromWorker()
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
    
    // MARK: - Test setup
    
    func setupLoginInteractor()
    {
        sut = LoginInteractor()
    }
    
    // MARK: - Test doubles
    
    class LoginPresentationLogicSpy: LoginPresentationLogic
    {
        // MARK: Method call expectations
        var presentUserAccounts = false
        
        var presentStatementsCalled = false
        
        // MARK: Spied methods
        func presentUserAccounts(response: LoginScene.Login.Response) {
            print("Entrou")
            presentUserAccounts = true
        }
        
        func presentStatements(response: LoginScene.Statements.Response) {
            presentStatementsCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testGetUserShouldAskPresenterToFormatResult()
    {
        // Given
        let showLoginPresentationLogicSpy = LoginPresentationLogicSpy()
        sut.presenter = showLoginPresentationLogicSpy
        
        // When
        let request = LoginScene.Login.Request(user: "test@test.com", pass: "!QAZ2wsx")
        print(request)
        sut.doLogin(request: request)
        let response = LoginScene.Login.Response(userAccounts: [Seeds.User.jose])
        sut.presenter?.presentUserAccounts(response: response)
        
        // Then
        XCTAssert(showLoginPresentationLogicSpy.presentUserAccounts, "Users() should ask presenter to format")
    }
    
    func RequestFromWorker() {
        let worker = LoginWorker()
        let username = "teste_user"
        let pass = "!QAZ2wsx"
        let expectation = self.expectation(description: "Scaling")
        worker.fetchUserID(user: username, pass: pass) { (useraccounts) in
            let response = LoginScene.Login.Response(userAccounts: useraccounts)
            print(useraccounts)
            self.sut.presenter?.presentUserAccounts(response: response)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_validatePassword()
    {
        var status = false
        let validation = ValidationsFields()
        if validation.isValidPassword(passID: "!QAZ2wsx") == false {
            status = false
        }else {status = true}
        XCTAssert(status, "Verificar senha")
    }
    
    
    func test_username_placeholder() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let login = storyboard.instantiateInitialViewController() as! LoginViewController
        let _ = login.view
        XCTAssertEqual("Username", login.usernameTxt!.placeholder!)
    }
    
}
