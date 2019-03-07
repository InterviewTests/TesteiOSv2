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
    static var allowSuccess: Bool = false
    
    class LoginPresenterMocker: LoginPresentationLogic {
        var expectedMsg: String = ""
        func showErrorMessage(message: String) {
            XCTAssert(!LoginInterectorTests.allowSuccess, "Validação incorreta")
            XCTAssertEqual(expectedMsg, message, "Esperado:\(expectedMsg) | Retornado:\(message)")
        }
        
        func routeShowStatement() {
            XCTAssert(LoginInterectorTests.allowSuccess, "Os dados não estão corretos para chamar Route")
        }
    }
    
    class LoginWorkerMoker: BankWorkerProtocol {
        func authenticate(user: String, password: String, completion: @escaping (User?, BankError?) -> Void) {
            XCTAssert(LoginInterectorTests.allowSuccess, "Os dados não estão corretos para chamar authenticate")
            completion(nil,nil)
        }
        
        func getStatements(userId: Int, completion: @escaping ([Statement]?, BankError?) -> Void) throws {
            
        }
    }
    
    override func setUp() {
        loginInteractor = LoginInteractor.init(worker: LoginWorkerMoker())
        loginInteractor.presenter = LoginPresenterMocker()
    }

    override func tearDown() {
        loginInteractor.presenter = nil
        loginInteractor = nil
    }

    func testValidadeMessageAutentication() {
        
        let presentation: LoginPresenterMocker = loginInteractor.presenter! as! LoginInterectorTests.LoginPresenterMocker
        LoginInterectorTests.allowSuccess = false
        
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
        LoginInterectorTests.allowSuccess = true
        loginInteractor.validateLoginData(user: user)
    }
}
