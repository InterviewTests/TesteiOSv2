//
//  AccountPresenter.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 29/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation

protocol AccountPresentationLogic {
    func presentStatementsFetched(_ statements: [Statement], _ error: Error?)
}

class AccountPresenter: AccountPresentationLogic {
    weak var viewController: AccountDisplayLogic?
    
    func presentStatementsFetched(_ statements: [Statement], _ error: Error?) {
        guard error == nil else {
            viewController?.showAlert(error?.localizedDescription ?? "Ocorreu um erro.")
            return
        }
        
        viewController?.showFetchedStatements(statements)
    }
}
