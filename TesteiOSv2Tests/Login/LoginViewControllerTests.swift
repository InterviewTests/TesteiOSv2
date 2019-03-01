//
//  LoginViewControllerTests.swift
//  TesteiOSv2Tests
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class LoginViewControllerTests: XCTestCase {
    
    var viewController: LoginViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupLoginViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func setupLoginViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
    }
    
    func loadView()
    {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
    
    func testRetrieveLastUserLogin(){
        let loginBusinessLogicSpy = LoginBusinessLogicSpy()
        viewController.interactor = loginBusinessLogicSpy
        loadView()

        // When
        viewController.viewDidAppear(true)
        
        // Then
        XCTAssertTrue(loginBusinessLogicSpy.retrieveLastUserLoginCalled)
    }

    func testCredentialValidation(){
        let loginBusinessLogicSpy = LoginBusinessLogicSpy()
        viewController.interactor = loginBusinessLogicSpy
        loadView()
        
        // When
        viewController.viewDidAppear(true)
        
        viewController.loginTapped(self)
        
        // Then
        XCTAssertTrue(loginBusinessLogicSpy.validateCredentialsCalled)
    }

    class LoginBusinessLogicSpy: LoginBusinessLogic{
        var retrieveLastUserLoginCalled = false
        var validateCredentialsCalled = false
        
        func validateCredentials(credentialsRequest: Login.CredentialsValidation.Request) {
            validateCredentialsCalled = true
        }
        
        func retrieveLastUserLogin(request: Login.LastUserLogin.Request) {
            retrieveLastUserLoginCalled = true
        }
    }
    
}
