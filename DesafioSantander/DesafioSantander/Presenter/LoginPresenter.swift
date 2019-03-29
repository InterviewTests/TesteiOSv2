//
//  LoginPresenter.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation

protocol LoginPresentationLogic {
    func presentUserLogged(_ user: UserAccount?, _ error: Error?)
    func presentPreviousUser(_ user: UserAccount?)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentUserLogged(_ user: UserAccount?, _ error: Error?) {
        guard error == nil else {
            viewController?.showAlert(error?.localizedDescription ?? "Ocorreu um erro.")
            return
        }
        
        viewController?.logged(user!)
    }
    
    func presentPreviousUser(_ user: UserAccount?) {
        guard let user = user else { return }
        viewController?.showPreviousUser(user)
    }
}
