//
//  LoginInterectorTests.swift
//  BankTests
//
//  Created by Administrador on 28/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest
@testable import Bank

class LoginInteractorTests: XCTestCase {
    
    var loginInteractor: LoginInteractor!
    static var allowSuccess: Bool = false
    
    class LoginPresenterMocker: LoginPresentationLogic {
        var expectedMsg: String = ""
        func showErrorMessage(message: String) {
            XCTAssert(!LoginInteractorTests.allowSuccess, "Validação incorreta")
            XCTAssertEqual(expectedMsg, message, "Esperado:\(expectedMsg) | Retornado:\(message)")
        }
        
        func routeShowStatement() {
            XCTAssert(LoginInteractorTests.allowSuccess, "Os dados não estão corretos para chamar Route")
        }
    }
    
    class LoginWorkerMoker: LoginWorkerProtocol {
        func authenticate(user: String, password: String, completion: @escaping (User?, BankError?) -> Void) {
            if(user == "" && password == "")
            {
                let error = BankError.authenticationError("Usuário não autenticado")
                completion(nil,error)
            }
            else
            {
                XCTAssert(LoginInteractorTests.allowSuccess, "Os dados não estão corretos para chamar authenticate")
                completion(nil,nil)
            }
        }
    }
    
    override func setUp() {
        super.setUp()
        loginInteractor = LoginInteractor.init(worker: LoginWorkerMoker())
        loginInteractor.presenter = LoginPresenterMocker()
    }

    override func tearDown() {
        loginInteractor.presenter = nil
        loginInteractor = nil
        super.tearDown()
    }

    func testValidadeMessageAutentication() {
        
        let presentation: LoginPresenterMocker = loginInteractor.presenter! as! LoginInteractorTests.LoginPresenterMocker
        LoginInteractorTests.allowSuccess = false
        
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
        
        user.password = "@"
        presentation.expectedMsg = "\r\nSenha incorreta!"
        loginInteractor.validateLoginData(user: user)
    }
    
    func testValidadeAutentication() {
        let user = Login.ViewModel.DiplayedUser(login:"teste@teste.com.br",password: "Test@1")
        LoginInteractorTests.allowSuccess = true
        loginInteractor.validateLoginData(user: user)
    }
    
    func testInvalidadeAutentication() {
        let user = Login.ViewModel.DiplayedUser(login:"",password: "")
        LoginInteractorTests.allowSuccess = false
        let presentation: LoginPresenterMocker = loginInteractor.presenter! as! LoginInteractorTests.LoginPresenterMocker
        presentation.expectedMsg = "Usuário não autenticado"
        loginInteractor.autenticate(request: user)
    }
}
