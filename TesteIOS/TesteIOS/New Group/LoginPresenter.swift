//
//  LoginPresenter.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright (c) 2019 ti alto nivel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic {
    func presentLogin(response: Login.doLogin.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    weak var repository: UserRepository?

    // MARK: Do something

    func presentLogin(response: Login.doLogin.Response) {
        if response.userAccount == nil && response.error?.count ?? 0 > 0 {
            for (title, message) in response.error! {
                viewController?.showAlertMsg(title: title, message: message)
            }
        } else {
            if (response.userAccount?.validUserAccount())! {
                repository?.saveUser(userAccount: response.userAccount!)
                viewController?.displayStatmentView()
            } else {
                viewController?.showAlertMsg(title: "Login falhou", message: "O usuário ou senha que você digitou está inválida")
            }
        }
    }
}
