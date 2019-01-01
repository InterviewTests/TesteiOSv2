//
//  IntroPresenter.swift
//  Bank App
//
//  Created by Chrystian on 24/11/18.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit

protocol IntroPresentationLogic {
    
    func showHistoryController()
    func showError(error: BankError)
}

class IntroPresenter: IntroPresentationLogic {
    
    weak var viewController: IntroDisplayLogic?
    
    func showHistoryController() {
        viewController?.presentDetailController()
    }
    
    func showError(error: BankError) {
        if let errorMessage = error.message {
            buildAlert(title: "Erro", menssage: errorMessage)
        }
    }
    
    private func buildAlert(title: String, menssage: String) {
        let alertBox = UIAlertController(title: title, message: menssage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            alertBox.dismiss(animated: true, completion: nil)
        }
        alertBox.addAction(action)
        viewController?.showError(alertBox)
    }
}
