//
//  LoginVCTests.swift
//  BankTests
//
//  Created by Administrador on 01/03/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest
import SwiftKeychainWrapper
@testable import Bank

class LoginVCTests: XCTestCase {

    var viewLogin: LoginVC!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewLogin = storyboard.instantiateViewController(withIdentifier: "loginView") as? LoginVC
        _ = viewLogin.view
    }

    override func tearDown() {
        viewLogin = nil
        KeychainWrapper.standard.removeAllKeys()
        super.tearDown()
    }
    
    func testLoadSavedUserName() {
        let login = "test"
        KeychainWrapper.standard.set(login, forKey: "userName")
        viewLogin!.viewWillAppear(false)
        XCTAssertEqual(viewLogin?.txtUser.text!, login, "Não carregou os dados do usuário")
        XCTAssertEqual(viewLogin?.txtPassword.text!, "", "Não limpou o campo senha")
    }
    
    func testLoadEmptyUserName() {
        KeychainWrapper.standard.removeAllKeys()
        viewLogin!.viewWillAppear(false)
        XCTAssertEqual(viewLogin?.txtUser.text!, "", "Não carregou os dados do usuário")
        XCTAssertEqual(viewLogin?.txtPassword.text!, "", "Não limpou o campo senha")
    }
}
