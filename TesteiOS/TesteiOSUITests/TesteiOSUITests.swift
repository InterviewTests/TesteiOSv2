//
//  TesteiOSUITests.swift
//  TesteiOSUITests
//
//  Created by Fernando Gomes on 13/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import XCTest

class TesteiOSUITests: XCTestCase {
    
    let validCpf = "69226248079"
    let invalidCpf = "69226248070"
    let validPassword = "Teste@1"
    let invalidPassword = "teste"

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testValidLogin() {
        let app = XCUIApplication()
        
        let userTextField = app.textFields["User"]
        XCTAssertTrue(userTextField.exists)
        userTextField.tap()
        userTextField.typeText(validCpf)
        
        let passwordTextField = app.textFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(validPassword)
        
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        loginButton.forceTap()
        
    }
    
    func testInvalidLogin() {
        
        let app = XCUIApplication()
        
        let userTextField = app.textFields["User"]
        XCTAssertTrue(userTextField.exists)
        userTextField.tap()
        userTextField.typeText(invalidCpf)
        
        let passwordTextField = app.textFields["Password"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText(invalidPassword)
        
        let loginButton = app.buttons["Login"]
        XCTAssertTrue(loginButton.exists)
        loginButton.forceTap()
        
        let expectation = XCTNSNotificationExpectation(name: NSNotification.Name(rawValue: "Login failed"))
        
        XCTWaiter().wait(for: [expectation], timeout: 2)
        
        let invalidAlert = app.alerts["Login failed"]
        XCTAssertTrue(invalidAlert.exists)
        invalidAlert.buttons["Try again"].tap()
    }
    

}

extension XCUIElement {
    func forceTap() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}
