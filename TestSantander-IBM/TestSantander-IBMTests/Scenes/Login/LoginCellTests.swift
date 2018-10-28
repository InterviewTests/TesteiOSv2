//
//  LoginCellTests.swift
//  TestSantander-IBMTests
//
//  Created by Erika Albizzati on 28/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class LoginCellTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_verifyValidFields(){
        let bundle = Bundle(for: LoginCell.self)
        guard let cell = bundle.loadNibNamed("LoginCell", owner: nil)?.first as? LoginCell else {
            return XCTFail()
        }
        cell.userTextField.text = "ealbizzati@gmail.com"
        cell.passwordTextField.text = "hgY%"
        let valid = cell.verifyIfValidFields()
        
        XCTAssertEqual(valid, true)
    }
    
    func test_setupDefaultValuesOnDismiss(){
        let bundle = Bundle(for: LoginCell.self)
        guard let cell = bundle.loadNibNamed("LoginCell", owner: nil)?.first as? LoginCell else {
            return XCTFail()
        }
        cell.setupDefaultValuesOnDismiss()
        XCTAssertEqual(cell.userValid, true)
        XCTAssertEqual(cell.pswdValid, false)
        XCTAssertNil(cell.userTextField.placeholder)
        XCTAssertEqual(cell.passwordTextField.placeholder, "Password")
        XCTAssertEqual(cell.passwordTextField.text, "")
        XCTAssertEqual(cell.loginBtn.isEnabled, false)
        XCTAssertEqual(cell.loginBtn.alpha, 0.5)
    }
    
    func test_loginTapped(){
        let bundle = Bundle(for: LoginCell.self)
        guard let cell = bundle.loadNibNamed("LoginCell", owner: nil)?.first as? LoginCell else {
            return XCTFail()
        }
        cell.userTextField.text = "ealbizzati"
        cell.passwordTextField.text = "khGˆ"
        
        cell.loginTapped()
        XCTAssertEqual(cell.userTextField.layer.borderColor, UIColor.red.cgColor)
        XCTAssertEqual(cell.passwordTextField.layer.borderColor, UIColor.red.cgColor)
    }
}
