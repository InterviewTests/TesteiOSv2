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
    func showLoading()
    func catchPasswordInvalid()
    func abortAutoLogin(error: BankError)
    func setDefaultStatusBar()
    func enableLoginButton(_ enable: Bool)
}

class IntroPresenter: IntroPresentationLogic {
    
    weak var viewController: IntroDisplayLogic?
    
    func showHistoryController() {
        viewController?.presentDetailController()
        viewController?.configureLoginAnimationCompletion()
    }
    
    func showError(error: BankError) {
        if let errorMessage = error.message {
            buildAlert(title: "Erro", menssage: errorMessage)
        }
        viewController?.configureLoginAnimationCompletion()
    }
    
    func showLoading() {
        viewController?.configureLoginAnimationLoading()
    }
    
    func catchPasswordInvalid() {
        
        buildAlert(title: NSLocalizedString("SENHA_INVALIDA", comment: ""), menssage: NSLocalizedString("SENHA_INVALIDA_ERROR_MESSAGE", comment: ""))
        viewController?.configureLoginAnimationCompletion()
        viewController?.configureInvalidPassword()
    }
    
    func abortAutoLogin(error: BankError) {
        #if DEBUG
            print(error.message)
        #endif
    }
    
    func setDefaultStatusBar() {
        viewController?.setupStatusBar(statusBarStyle: .default, backgroudColor: .clear)
    }
    
    func enableLoginButton(_ enable: Bool) {
        viewController?.enableLogin(enable)
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
