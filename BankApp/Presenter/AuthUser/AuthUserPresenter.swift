//
//  AuthUserPresenter.swift
//  Presenter
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

public final class AuthUserPresenter {
    private let alertView: AlertViewProtocol
    private let userNameValidate: UserNameValidateProtocol
    
    public init(alertView: AlertViewProtocol, userNameValidate: UserNameValidateProtocol) {
        self.alertView = alertView
        self.userNameValidate = userNameValidate
    }
    
    public func auth(viewModel: AuthUserViewModel) {
        userNameValidate.isValid(userName: viewModel.userName)
        if let viewModel = errorViewModel(viewModel) {
            alertView.presentMessageWith(viewModel)
        }
    }
    
    private func errorViewModel(_ viewModel: AuthUserViewModel) -> AlertViewModel? {
        let title = "Fail in auth the user"
        var message = "The field %@ is mandatory"
        if !StringCheck.isValidField(viewModel.password) {
            message = String(format: message, "Password")
        } else if !StringCheck.isValidField(viewModel.userName) {
            message = String(format: message, "Name User")
        } else {
            return nil
        }
        return .init(title: title, message: message)
    }
}
