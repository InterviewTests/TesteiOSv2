//
//  LoginPresenter.swift
//  BankApp
//
//  Created by resource on 16/06/19.
//  Copyright (c) 2019 Gabriel Faustino. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic{
    func showErrorOnLogin(_ message: String, isBadInput: Bool)
    
    func goToStatement()
}

class LoginPresenter: LoginPresentationLogic{
    weak var viewController: LoginDisplayLogic?
    
    func showErrorOnLogin(_ message: String, isBadInput: Bool) {
        let title = isBadInput ? "Tente novamente" : "Houve um problema"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            alert.close()
        }))
        viewController?.displayAlert(alert)
    }
    
    func goToStatement() {
        viewController?.goToStatement()
    }
}
