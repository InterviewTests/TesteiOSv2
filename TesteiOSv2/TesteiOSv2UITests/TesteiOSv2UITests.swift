//
//  TesteiOSv2UITests.swift
//  TesteiOSv2UITests
//
//  Created by Felipe perius on 17/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import XCTest

class TesteiOSv2UITests: XCTestCase {
    private let enterButton = "enterLogin"
    //LOGIN DATA
    private let defaultEmailForLogin = "user.test@mail.com"
    private let defaultPasswordForLogin = "P@123"
    private let textfieldDoneButtonString = "textfieldDoneButton"
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    
    func testApp() {
        fluxLogin()
    }
   
    func launchWithReset() {
        let app = XCUIApplication()
        app.launchArguments = ["--Reset"]
        app.launch()
    }
    
    func fluxLogin(){
        invalidEmailLogin()
        launchWithReset()
        invalidPassLogin()
        launchWithReset()
        login()
    }
    

    
    func login() {
        let btnEnter = app.buttons["enterLogin"]
        let emailTextField = app.textFields["simpleTextfield"]
        emailTextField.tap()
        emailTextField.typeText(defaultEmailForLogin)
      
    
        let passwordTxt = app.secureTextFields["simpleTextfield"]
        passwordTxt.tap()
        passwordTxt.typeText(defaultPasswordForLogin)
        btnEnter.tap()
    }
    
    func invalidEmailLogin() {
        
        let btnEnter = app.buttons["enterLogin"]
       
        let emailTextField = app.textFields["simpleTextfield"]
        app.clearTextOnElement(emailTextField)
        emailTextField.tap()
        emailTextField.typeText("emailinvalido")
        
        
        let passwordTxt = app.secureTextFields["simpleTextfield"]
        passwordTxt.tap()
        passwordTxt.typeText(defaultPasswordForLogin)
        btnEnter.tap()
    }
    
    func invalidPassLogin() {
        let btnEnter = app.buttons["enterLogin"]
      
        let emailTextField = app.textFields["simpleTextfield"]
        app.clearTextOnElement(emailTextField)
        emailTextField.tap()
        emailTextField.typeText("email@valido.com")
        //app.buttons["return"].tap()
        
        
        let passwordTxt = app.secureTextFields["simpleTextfield"]
        passwordTxt.tap()
        passwordTxt.typeText("123")
        btnEnter.tap()
    }

}
