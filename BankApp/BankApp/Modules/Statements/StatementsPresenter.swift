//
//  StatementsPresenter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class StatementsPresenter {
    
    weak var view: StatementsPresenterDelegate?
    var router: StatementsRouter?
}

// MARK: - Access from Interactor

extension StatementsPresenter: StatementsPresenterProtocol {
    func presentUserInfo() {
        // TODO: Converter informações no formato de apresentação
        view?.showUserInfo()
    }
    
    func startRequest() {
        view?.startRequesting()
    }
    
    func finishRequest() {
        view?.finishRequesting()
    }
    
    func presentFetchedStatements(response: StatementsModels.Response) {
        // TODO: Converter para ViewModel
        
        view?.displayStatements()
    }
    
    func didFailToFetchStatement(_ errorMessage: String) {
        view?.showFailToFetchStatements(errorMessage)
    }
}
