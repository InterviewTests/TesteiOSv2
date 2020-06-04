//
//  AuthUserPresenter.swift
//  Presenter
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation
import Domain

public final class AuthUserPresenter {
    private let alertView: AlertViewProtocol
    private let userNameValidate: UserNameValidateProtocol
    private let authClientUseCase: AuthClientUseCaseProtocol
    
    public init(alertView: AlertViewProtocol, userNameValidate: UserNameValidateProtocol, authClientUseCase: AuthClientUseCaseProtocol) {
        self.alertView = alertView
        self.userNameValidate = userNameValidate
        self.authClientUseCase = authClientUseCase
    }
    
    public func auth(viewModel: AuthUserViewModel) {
        userNameValidate.isValid(userName: viewModel.userName)
        if let viewModel = errorViewModel(viewModel) {
            alertView.presentMessageWith(viewModel)
        } else {
            guard let user = viewModel.userName, let password = viewModel.password else { return }
            let authClientModel = AuthClientModel(user: user, password: password)
            authClientUseCase.login(authenticationModel: authClientModel) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure:
                    self.alertView.presentMessageWith(.init(title: "Fail", message: "An unexpected error occurred, try again"))
                case .success: break
                }
            }
        }
    }
    
    private func errorViewModel(_ viewModel: AuthUserViewModel) -> AlertViewModel? {
        var title = "Fail in auth the user"
        var message = ""
        if !StringCheck.isValidField(viewModel.password) {
            message = "The field Password is mandatory"
        } else if !StringCheck.isValidField(viewModel.userName) {
            message = "The field User Name is mandatory"
        } else if !userNameValidate.isValid(userName: viewModel.userName) {
            title = "The field User Name is wrong"
            message = "You should put an email or cpf valid"
        } else {
            return nil
        }
        return .init(title: title, message: message)
    }
}
