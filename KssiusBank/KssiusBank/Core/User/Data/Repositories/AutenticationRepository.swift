//
//  AutenticationRepository.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

final class AuthenticationRepository: AuthenticationRepositoryProtocol {

    // MARK: - Properties

    private let authenticationService: AuthenticationServiceDatasourceProtocol

    // MARK: - Inits

    init(authenticationService: AuthenticationServiceDatasourceProtocol) {
        self.authenticationService = authenticationService
    }

}

// MARK: - POST Methods

extension AuthenticationRepository {
    func perform(login: AutenticationApi.Endpoints, with data: LoginRequestModel, completion: @escaping (Result<UserAccountModel, UserFailure>) -> Void) {

        if (!CommonValidator.User.isCpf(data.username) && !CommonValidator.User.isEmail(data.username)) {
            completion(.failure(.user))
            return
        }

        if (!CommonValidator.User.validatePassword(data.password)) {
            completion(.failure(.password))
            return
        }

        authenticationService.perform(login: login, with: data){ result in
            switch(result) {
            case .success(let model): completion(.success(model))
            case .failure( _):
                completion(.failure(.network(.init())))
            }
        }
    }
}
