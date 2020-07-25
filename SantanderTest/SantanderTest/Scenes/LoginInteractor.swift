//
//  LoginInteractor.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func login(with user: String?, and password: String?)
}

class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic?
    var worker: LoginNetworkLogic
    
    init(with worker: LoginNetworkLogic = LoginWorker()) {
        self.worker = worker
    }
    
    // MARK: Business logic
    func login(with user: String?, and password: String?) {
        if let user = user, !user.isEmpty, let pwd = password, !pwd.isEmpty  {
            if pwd.isValidPassword {
                presenter?.shouldPresentLoading(true)
                let request = Login.Request(user: user, password: pwd)
                worker.performLogin(with: request).done(handleSuccess).catch(handleError)
            } else {
                presentError(with: "A senha tem que ter pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico")
            }
        } else {
            presentError(with: "Ambos os campos devem ser preenchidos")
        }
    }
    
    func handleSuccess(response: Login.Response) {
        presenter?.shouldPresentLoading(false)
        if let error = response.error?.message {
            presentError(with: error)
        }
    }
    
    func handleError(error: Error) {
        presentError(with: error.localizedDescription)
    }
    
    func presentError(with message: String) {
        presenter?.shouldPresentLoading(false)
        presenter?.onError(title: "Erro", message: message)
    }
}
