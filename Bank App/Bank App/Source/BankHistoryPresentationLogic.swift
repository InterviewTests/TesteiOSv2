//
//  BankHistoryPresentationLogic.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import UIKit

protocol BankHistoryPresentationLogic {
    
    func displayStatements(_ statements: [Statement])
    func showError(error: BankError)
    func configureStatusBar(statusBarStyle: UIStatusBarStyle, backgroudColor: UIColor?)
}

class BankHistoryPresenter: BankHistoryPresentationLogic {
    
    weak var viewController: BankHistoryDisplayLogic?
    
    func displayStatements(_ statements: [Statement]) {
        viewController?.displayData(statements)
    }
    
    func showError(error: BankError) {
        if let errorMessage = error.message {
            buildAlert(title: "Erro", menssage: errorMessage)
        }
    }
    
    private func buildAlert(title: String, menssage: String) {
        let alertBox = UIAlertController(title: title, message: menssage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            alertBox.dismiss(animated: true, completion: {
                self.viewController?.requestElements()
            })
        }
        alertBox.addAction(action)
        viewController?.showError(alertBox)
    }
    
    func configureStatusBar(statusBarStyle: UIStatusBarStyle, backgroudColor: UIColor?) {
        viewController?.setupStatusBar(statusBarStyle: statusBarStyle, backgroudColor: backgroudColor)
    }
}
