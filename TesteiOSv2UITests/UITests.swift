//
//  TesteiOSv2UITests.swift
//  TesteiOSv2UITests
//
//  Created by Marcel Mendes Filho on 26/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest

class UITests: XCTestCase {
    
    let username = "marcel.mendes@accenture.com\n"
    let password = "A1$\n"

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

    func testForLoginUIElementsExistence(){
        let app = XCUIApplication()
        XCTAssertTrue(app.images["Bank_Logo"].exists)
        XCTAssertTrue(app.textFields["User"].exists)
        XCTAssertTrue(XCUIApplication().secureTextFields["Password"].exists)
        XCTAssertTrue(app.buttons["Login"].exists)
    }

    func testInvalidUsernameMessage() {
        let app = XCUIApplication()
        app.textFields["User"].tap()
        app.textFields["User"].clearAndEnterText(text: "marcel.mendes@accenture\n")
        app.secureTextFields["Password"].typeText("\n")

        app.buttons["Login"].tap()
        
        let userMessage = app.staticTexts.element.label

        XCTAssertTrue(userMessage.contains("email ou CPF válidos"))
    }

    func testInvalidPasswordMessage() {
        let app = XCUIApplication()
        app.textFields["User"].tap()
        app.textFields["User"].clearAndEnterText(text: "marcel.mendes@accenture.com\n")
        app.secureTextFields["Password"].typeText("\n")
        
        app.buttons["Login"].tap()
        
        let userMessage = app.staticTexts.element.label
        
        XCTAssertTrue(userMessage.contains("A senha deve conter"))
    }
    
    func testSuccessfulLogin(){
        let app = XCUIApplication()
        login(app: app)
    }
    
    func testSuccessfulHeaderPresentation(){
        let app = XCUIApplication()
        login(app: app)
        XCTAssertTrue(app.staticTexts["Jose da Silva Teste"].exists)
    }
    
    func testSuccessfulStatementPresentation(){
        let app = XCUIApplication()
        login(app: app)
        let elements = app.staticTexts.allElementsBoundByIndex.count
        XCTAssertTrue(elements == 42)
    }
    
    func testSuccessfulLogout(){
        let app = XCUIApplication()
        
        login(app: app)

        // logout
        let exists = NSPredicate(format: "exists == 1")
        let logoImage = app.images["Bank_Logo"]
        expectation(for: exists, evaluatedWith: logoImage, handler: nil)
        app.buttons["logout"].tap()
        waitForExpectations(timeout: 10, handler: nil)
    }

    //MARK: Helper functions
    func login(app: XCUIApplication){

        // data entry
        app.textFields["User"].tap()
        app.textFields["User"].clearAndEnterText(text: username)
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText(password)

        // successful login
        let logoutButton = app.buttons["logout"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: logoutButton, handler: nil)
        app.buttons["Login"].tap()
        waitForExpectations(timeout: 30, handler: nil)
    }

}


