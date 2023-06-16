//
//  LoginInteractor.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic
{
    func login(request: Login.Login.Request)
}

protocol LoginDataStore
{
    var account: UserAccountModel? { get set }
}

final class LoginInteractor: LoginBusinessLogic, LoginDataStore {

    // MARK: - Properties

    private let presenter: LoginPresentationLogic?
    private let worker: LoginWorker?

    // MARK: - DataSource
    var account: UserAccountModel?

    // MARK: - Inits

    init(presenter: LoginPresentationLogic? = nil, worker: LoginWorker? = nil) {
        self.presenter = presenter
        self.worker = worker
    }

}

// MARK: - Login

extension LoginInteractor {

    func login(request: Login.Login.Request)
    {
        guard let user = request.user, let password = request.password else {
            let errorMessage = L10n.User.Authentication.Error.general
            let response = Login.Login.Response(success: false, errorMessage: errorMessage)
            self.presenter?.resolveLogin(response: response)
            return
        }

        worker?.login(username: user, password: password) {[weak self] result in
            switch( result ) {
            case .success(let accountModel):
                self?.account = accountModel
                self?.presenter?.resolveLogin(response: .init(success: true))
            case .failure(let failure):
                if let response = self?.process(errors: failure) {
                    self?.presenter?.resolveLogin(response: response)
                }
            }
        }
    }

    private func process(errors: UserFailure) -> Login.Login.Response {
        switch(errors) {
        case .user:
            return .init(errorMessage: L10n.User.Authentication.Error.invalidCpf)
        case .password:
            return .init(errorMessage: L10n.User.Authentication.Error.invalidPassword)
        case .network( _):
            return .init(errorMessage: L10n.Network.Error.general)
        }

    }
}
