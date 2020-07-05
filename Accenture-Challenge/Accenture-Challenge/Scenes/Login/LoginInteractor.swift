//
//  LoginInteractor.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol LoginBusinessLogic {
    func fetchLogin(request: Login.Info.LoginRequest)
}

protocol LoginDataStore {
    var loginResponse: Login.Info.LoginResponse? { get set }
}

class LoginInteractor: LoginDataStore {
    
    private var presenter: LoginPresentationLogic
    private var worker: LoginWorkerProtocol
    
    var loginResponse: Login.Info.LoginResponse?
    
    init(viewController: LoginDisplayLogic,
         presenter: LoginPresentationLogic = LoginPresenter(),
         worker: LoginWorkerProtocol = LoginWorker()) {
        self.worker = worker
        self.presenter = presenter
        self.presenter.viewController = viewController
    }

}

extension LoginInteractor: LoginBusinessLogic {
    
    func fetchLogin(request: Login.Info.LoginRequest) {
        guard request.user.isValidEmail() else {
            presenter.invalidEmailRequest()
            return
        }
        guard request.password.hasUppercaseLetter(),
            request.password.hasSpecialCharacters(),
            request.password.hasNumber() else {
            presenter.invalidpasswordRequest()
            return
        }
        worker.fetchLogin(request: request) { response in
            switch response {
            case .success(let user):
                self.loginResponse = user
                self.presenter.didFetchLoginResponse()
                break
            case .error(let error):
                self.presenter.didFetchError(error.localizedDescription)
                break
            case .genericError:
                self.presenter.didFetchError("Generic error")
            }
        }
    }
}
