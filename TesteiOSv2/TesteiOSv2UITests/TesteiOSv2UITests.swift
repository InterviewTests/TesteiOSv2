//
//  TesteiOSv2UITests.swift
//  TesteiOSv2UITests
//
//  Created by Bruno on 09/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import XCTest

class TesteiOSv2UITests: XCTestCase {

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
    
    func testLoginSuccess() {
        
        let app = XCUIApplication()
        let userTextField = app.textFields["User"]
        userTextField.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".textFields[\"User\"].buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".secureTextFields[\"Password\"].buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        userTextField.tap()
        passwordSecureTextField.tap()
        hidesKeyboard(on: app)
        app.buttons["Login"].tap()
        
    }
    
    func testLoginFail() {
        
        let app = XCUIApplication()
        let userTextField = app.textFields["User"]
        userTextField.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".textFields[\"User\"].buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".secureTextFields[\"Password\"].buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        userTextField.tap()
        passwordSecureTextField.tap()
        hidesKeyboard(on: app)
        app.buttons["Login"].tap()
        
    }
    
    private func hidesKeyboard(on app: XCUIApplication) {
        let firstKey = XCUIApplication().keys.element(boundBy: 0)
        if firstKey.exists {
            app.typeText("\n")
        }
    }
    
    func testInvalidName() {
        
        let app = XCUIApplication()
        app.textFields["User"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".textFields[\"User\"].buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.otherElements["Typing Predictions"]/*[[".keyboards.otherElements[\"Typing Predictions\"]",".otherElements[\"Typing Predictions\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .other).element(boundBy: 2).tap()
        hidesKeyboard(on: app)
        app.buttons["Login"].tap()
        
    }
    
    func testInvalidPassword() {
        
        let app = XCUIApplication()
        app.secureTextFields["Password"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".secureTextFields[\"Password\"].buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.textFields["User"].tap()
        hidesKeyboard(on: app)
        app.buttons["Login"].tap()
        
    }
    
    func testStatementsScene() {
        
        let app = XCUIApplication()
        let userTextField = app.textFields["User"]
        userTextField.tap()
        
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey/*@START_MENU_TOKEN@*/.press(forDuration: 1.7);/*[[".tap()",".press(forDuration: 1.7);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        userTextField.typeText("test@email.com")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        deleteKey/*@START_MENU_TOKEN@*/.press(forDuration: 0.5);/*[[".tap()",".press(forDuration: 0.5);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        passwordSecureTextField.typeText("T3#")
        
        hidesKeyboard(on: app)
        app.buttons["Login"].tap()
        app.buttons["logout 2"].tap()
    }
}
