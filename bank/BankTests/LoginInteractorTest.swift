//
//  LoginInteractorTest.swift
//  BankTests
//
//  Created by Administrador on 28/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest

class LoginInteractorTest: XCTestCase {
    
    var loginInteractor: LoginInteractor!
    var returnMessage: String = ""
    
    override func setUp() {
        loginInteractor = LoginInteractor()
    }

    override func tearDown() {
        loginInteractor = nil
    }
    
    func testAutenticationNotUser() {
        let user = Login.ViewModel.DiplayedUser(login: "", password: "Test@1")
        returnMessage = "teste"
        loginInteractor.validateLoginData(user: user)
    }

}
