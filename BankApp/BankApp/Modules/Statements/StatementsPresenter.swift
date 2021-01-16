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
    
}
