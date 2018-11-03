//
//  LoginTest.swift
//  bankibmTests
//
//  Created by Alexandre Furquim on 03/11/18.
//  Copyright © 2018 Alexandre Furquim. All rights reserved.
//

import XCTest
@testable import bankibm

class LoginTest: XCTestCase {
    
    var vcLogin: LoginViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vcLogin = vc
        _ = vcLogin.view // To call viewDidLoad
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_verifyValidFields(){
        
        vcLogin.txtLogin.text = "alexandrefqm@gmail.com"
        vcLogin.txtPassword.text = "Fqm@"
        
        let valid = vcLogin.isUserValid() && vcLogin.isPasswordValid()
        
        XCTAssertEqual(valid, true)
    }
}
