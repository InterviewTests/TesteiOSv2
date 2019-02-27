//
//  StatementPresenter.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

protocol StatementPresentationLogic {
    func loadViewData(user: StatementView.ViewModel.DisplayedStatementUser?)
    func cleanData()
}

class StatementPresenter: StatementPresentationLogic {
    weak var viewController: StatementDisplayLogic?
    
    func showErrorMessage(message: String) {
        viewController!.showErrorMessage(message: message)
    }
    
    func loadViewData(user: StatementView.ViewModel.DisplayedStatementUser?) {
        if let user = user {
            viewController!.setUserData(user)
        }
        else
        {
            viewController!.setUserData(StatementView.ViewModel.DisplayedStatementUser(user: nil))
        }
    }
    
    func cleanData() {
        viewController = nil
    }
}
