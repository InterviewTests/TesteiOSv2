//
//  LoginInterectorTests.swift
//  BankTests
//
//  Created by Administrador on 28/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest

class LoginInterectorTests: XCTestCase {
    
    var loginInteractor: LoginInteractor!
    
    class LoginPresenterMocker: LoginPresentationLogic {
        var expectedMsg: String = ""
        func showErrorMessage(message: String) {
            XCTAssertEqual(expectedMsg, message, "Esperado:\(expectedMsg) | Retornado:\(message)")
        }
        
        func routeShowStatement() {
            
        }
    }
    
    override func setUp() {
        loginInteractor = LoginInteractor()
        loginInteractor.presenter = LoginPresenterMocker()
    }

    override func tearDown() {
        loginInteractor.presenter = nil
        loginInteractor = nil
    }

    func testValidadeMessageAutentication() {
        
        let presentation: LoginPresenterMocker = loginInteractor.presenter! as! LoginInterectorTests.LoginPresenterMocker
        
        var user = Login.ViewModel.DiplayedUser(login:"",password: "Test@1")
        presentation.expectedMsg = "\r\nInforme o nome do usuário!"
        loginInteractor.validateLoginData(user: user)
        
        user.login = "test"
        presentation.expectedMsg = "\r\nInforme um usuário válido!"
        loginInteractor.validateLoginData(user: user)
        
        user.login = "teste@teste.com.br"
        user.password = ""
        presentation.expectedMsg = "\r\nInforme a senha!"
        loginInteractor.validateLoginData(user: user)
        
        user.password = "test"
        presentation.expectedMsg = "\r\nSenha incorreta!"
        loginInteractor.validateLoginData(user: user)
    }
}
