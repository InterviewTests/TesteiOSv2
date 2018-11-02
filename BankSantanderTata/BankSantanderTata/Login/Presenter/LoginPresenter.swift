//
//  LoginPresenter.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit

final class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: LoginViewProtocol!
    var router: LoginRouterProtocol!
    var interactor: LoginInteractorProtocol!
    
    func buttonLoginPressed(userName: String?, password: String?) {
        //TODO: implementar validacao
        self.router.presentCurrencyScreen()
    }
    
}
