//
//  StatetmentPresenterTests.swift
//  BankTests
//
//  Created by Administrador on 07/03/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest

class StatetmentPresenterTests: XCTestCase {
    
    var statementInteractor: StatementInteractor!
    var viewController = StatementVCMoker()
    static var statementItem: StatementView.ViewModel.DisplayedStatementItem!
    static var userItem: StatementView.ViewModel.DisplayedStatementUser!
    
    let dateShort: DateFormatter = {
        let dateShort = DateFormatter()
        dateShort.dateFormat = "yyyy-MM-dd"
        return dateShort
    }()
    
    let dateDisplay: DateFormatter = {
        let dateDisplay = DateFormatter()
        dateDisplay.dateFormat = "dd/MM/yyyy"
        return dateDisplay
    }()
    
    class StatementVCMoker: StatementDisplayLogic {
        func showErrorMessage(message: String) {
            
        }
        
        func setUserData(_ user: StatementView.ViewModel.DisplayedStatementUser) {
            XCTAssert(StatetmentPresenterTests.userItem.name == user.name &&
                StatetmentPresenterTests.userItem.account == user.account &&
                StatetmentPresenterTests.userItem.balance == user.balance, "Usuário foi modificado")
        }
        
        func setStatements(statementsDisplay: [StatementView.ViewModel.DisplayedStatementItem]) {
            XCTAssert(StatetmentPresenterTests.statementItem.title == statementsDisplay[0].title &&
                StatetmentPresenterTests.statementItem.desc == statementsDisplay[0].desc &&
                StatetmentPresenterTests.statementItem.date == statementsDisplay[0].date &&
                StatetmentPresenterTests.statementItem.value == statementsDisplay[0].value, "Item do extrato foi modificado")
        }
    }

    override func setUp() {
        statementInteractor = StatementInteractor.init(worker: StatementInteractorTests.StatementWorkerMoker())
        statementInteractor.presenter = StatementPresenter()
        let presenter = statementInteractor.presenter as! StatementPresenter
        presenter.viewController = viewController
    }

    override func tearDown() {
        statementInteractor.presenter = nil
        statementInteractor = nil
        StatementInteractorTests.statement = nil
        StatementInteractorTests.user = nil
        
        StatementInteractorTests.statement = nil
        StatetmentPresenterTests.statementItem = nil
        StatementInteractorTests.user = nil
        StatetmentPresenterTests.userItem = nil
    }

    func testPresenter() {
        StatementInteractorTests.statement = Statement(title: "Titulo", desc: "Descrição", date: "2019-03-07", value: 1.0)
        
        StatementInteractorTests.user = User(userId: 1, name: "Teste", bankAccount: "1-1", agency: "1", balance: 0.0)
        statementInteractor.user = StatementInteractorTests.user
        
        StatetmentPresenterTests.userItem = StatementView.ViewModel.DisplayedStatementUser(user: statementInteractor.user)
        
        let total = Helpers.formmaterCurrency(value: StatementInteractorTests.statement.value)
        StatetmentPresenterTests.statementItem = StatementView.ViewModel.DisplayedStatementItem.init(title: StatementInteractorTests.statement.title, desc: StatementInteractorTests.statement.desc, date: dateDisplay.string(from:dateShort.date(from: StatementInteractorTests.statement.date)!), value: total)
        
        statementInteractor.loadViewData()
    }

}
