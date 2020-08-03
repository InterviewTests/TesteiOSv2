//
//  LoginPresenter.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic: AnyObject {
    func presentSuccessLogin()
    func presentUncompletedFieldsError()
    func presentErrorLogin()
}

extension LoginPresenter: LoginPresentationLogic {
    func presentSuccessLogin() {
        viewController?.displaySuccessLogin()
    }
    
    func presentUncompletedFieldsError() {
        let alert = createAlert(title: StringTables.LocalizedLogin.errorTitle.string,
                                message: StringTables.LocalizedLogin.uncompletedFieldsMessage.string,
                                buttonTitle: StringTables.LocalizedLogin.errorButtonTitle.string)
        viewController?.displayErrorLogin(alert)
    }
    
    func presentErrorLogin() {
        let alert = createAlert(title: StringTables.LocalizedLogin.errorTitle.string,
                                message: StringTables.LocalizedLogin.wrongFieldsMessage.string,
                                buttonTitle: StringTables.LocalizedLogin.errorButtonTitle.string)
        viewController?.displayErrorLogin(alert)
    }
}

class LoginPresenter: NSObject {
    weak var viewController: LoginDisplayLogic?
    
    init(viewController: LoginDisplayLogic) {
        self.viewController = viewController
    }
    
    private func createAlert(title: String, message: String, buttonTitle: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(button)
        return alert
    }
}
