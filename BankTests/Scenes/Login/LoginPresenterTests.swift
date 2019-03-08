//
//  LoginPresenterTests.swift
//  BankTests
//
//  Created by Administrador on 08/03/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest
@testable import Bank

class LoginPresenterTests: XCTestCase {

    var loginPresenter:LoginPresenter!
    var viewController: LoginVCMoker!
    
    class LoginVCMoker: LoginDisplayLogic {
        var expectedMsg: String = ""
        
        func showErrorMessage(message: String) {
            XCTAssertEqual(expectedMsg, message, "Esperado:\(expectedMsg) | Retornado:\(message)")
        }
        
        func routeShowStatement() {
            
        }
        
        func hiddenModal() {
            
        }
    }
    
    override func setUp() {
        loginPresenter = LoginPresenter()
        viewController = LoginVCMoker()
        loginPresenter.viewController = viewController
        super.setUp()
    }

    override func tearDown() {
        loginPresenter.viewController = nil
        loginPresenter = nil
        viewController = nil
        super.tearDown()
    }
    
    func testMessageError() {
        let viewController = loginPresenter.viewController as! LoginVCMoker
        viewController.expectedMsg = "Teste de Mensagem"
        loginPresenter.showErrorMessage(message: viewController.expectedMsg)
    }

}
