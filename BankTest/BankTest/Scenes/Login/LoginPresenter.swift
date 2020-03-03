//
//  LoginPresenter.swift
//  BankTest
//
//  Created by Luan Nascimento Almeida on 02/03/20.
//  Copyright (c) 2020 bank. All rights reserved.

import UIKit

protocol LoginPresentationLogic: class {
  func logged(source: LoginDataStore)
}

class LoginPresenter: LoginPresentationLogic, ErrorDisplayLogic {

    weak var viewController: (LoginDisplayLogic & ErrorDisplayLogic)?

    func logged(source: LoginDataStore) {
        viewController?.routeToDashboard(source: source)
    }

    func showError(message: String) {
        viewController?.showError(message: message)
    }
}
