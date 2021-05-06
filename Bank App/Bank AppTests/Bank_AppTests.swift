//
//  Bank_AppTests.swift
//  Bank AppTests
//
//  Created by Christian Castro on 28/04/21.
//

import XCTest
@testable import Bank_App

class Bank_AppTests: XCTestCase {
    
    let mockBankApp = MockBankApp()
    
    func testLogin() {
        mockBankApp.login(path: "login", user: "test", password: "123") { (result) in
            switch result {
            case .success(let data):
                print(data)
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
    
    func testCurrencyByUser() {
        mockBankApp.getCurrencyByUser(user: 3) { (result) in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
    
    func testFieldsValidation() {
        let isValidUser = mockBankApp.checkUsersField(user: "chris@apple.com")
        let isValidPassword = mockBankApp.checkPasswordField(password: "aA@123")
        XCTAssertTrue(isValidUser)
        XCTAssertTrue(isValidPassword)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
