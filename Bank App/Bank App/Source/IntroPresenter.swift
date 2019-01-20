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
    
    private func buildAlert(title: String, menssage: String) {

        let alertBox = UIAlertController(title: title, message: menssage, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            alertBox.dismiss(animated: true, completion: nil)
        }
        alertBox.addAction(action)
        
        viewController?.showError(alertBox)
    }
}

class LoadingView {
    
    var spinningView: UIActivityIndicatorView?
    
    init() {
        self.spinningView = UIActivityIndicatorView(style: .gray)
    }
    
    func show(in view: UIView) {
        
        if let _ = spinningView {
            spinningView?.center = view.center
            spinningView?.startAnimating()
            view.addSubview(spinningView!)
        }
    }
    
    func dismiss() {
        
        spinningView?.stopAnimating()
        spinningView = nil
    }
}
