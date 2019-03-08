//
//  StatementInteractorTest.swift
//  BankTests
//
//  Created by Administrador on 07/03/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest
@testable import Bank

class StatementInteractorTests: XCTestCase {

    var statementInteractor: StatementInteractor!
    static var statement: Statement!
    static let errorMessageRequest = "Ocorreu um erro na requisição"
    static var user: User!
    static var allowSuccess: Bool = false
    
    class StatementPresenterMocker: StatementPresentationLogic {
        var expectedMsg: String = ""
        
        func showErrorMessage(message: String) {
            XCTAssert(!StatementInteractorTests.allowSuccess, "Validação incorreta")
            XCTAssertEqual(expectedMsg, message, "Esperado:\(expectedMsg) | Retornado:\(message)")
        }
        
        func loadViewDataUser(user: User?) {
            XCTAssert(StatementInteractorTests.user == user, "Os dados do usuário foi modificado")
        }
        
        func loadViewDataStatement(statements: [Statement]?) {
            if(StatementInteractorTests.allowSuccess) {
                XCTAssert(statements?.count == 1, "Quantidade retornada deveria ser 1 item")
                XCTAssert(StatementInteractorTests.statement == statements![0], "Item do extrato foi modificado") 
            }
            else
            {
                XCTAssert(statements == nil, "Quantidade retornada deveria ser 0 item")
            }
        }
        
        func cleanData() {
            
        }
    }
    
    class StatementWorkerMoker: StatementWorkerProtocol {
        func getStatements(userId: Int, completion: @escaping ([Statement]?, BankError?) -> Void) throws {
            if(userId == 0) {
                completion(nil, .badRequest(errorMessageRequest))
            }
            else
            {
                completion([StatementInteractorTests.statement], nil)
            }
        }
    }
    
    override func setUp() {
        super.setUp()
        statementInteractor = StatementInteractor.init(worker: StatementWorkerMoker())
        statementInteractor.presenter = StatementPresenterMocker()
    }

    override func tearDown() {
        statementInteractor.presenter = nil
        statementInteractor = nil
        StatementInteractorTests.statement = nil
        StatementInteractorTests.user = nil
        super.tearDown()
    }
    
    func testLoadData() {
        StatementInteractorTests.allowSuccess = true
        StatementInteractorTests.statement = Statement(title: "Titulo", desc: "Descrição", date: "2019-03-07", value: 1.0)
        StatementInteractorTests.user = User(userId: 1, name: "Teste", bankAccount: "1-1", agency: "1", balance: 0.0)
        statementInteractor.user = StatementInteractorTests.user
        statementInteractor.loadViewData()
    }
    
    func testLoadDataError() {
        StatementInteractorTests.allowSuccess = false
        StatementInteractorTests.user = User(userId: 0, name: "", bankAccount: "", agency: "", balance: 0.0)
        statementInteractor.user = StatementInteractorTests.user
        let presenter: StatementPresenterMocker = (statementInteractor.presenter as! StatementPresenterMocker)
        presenter.expectedMsg = StatementInteractorTests.errorMessageRequest
        statementInteractor.loadViewData()
    }
}
