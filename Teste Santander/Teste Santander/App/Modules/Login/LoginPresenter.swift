//
//  LoginPresenter.swift
//  Teste Santander
//
//  Created by VM on 23/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

import Foundation

class LoginPresenter: ViewToLoginPresenterProtocol {
    var view: PresenterToLoginViewProtocol?
    var interactor: PresenterToLoginInteractorProtocol?
    var router: PresenterToLoginRouterProtocol?
    
}

extension LoginPresenter: InteractorToLoginPresenterProtocol {
    
}
