//
//  AutenticationRepository.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

final class AuthenticationRepository :AuthenticationRepositoryProtocol {

    let authenticationService: AuthenticationServiceDatasourceProtocol

    // MARK: - Inits

    init(authenticationService: AuthenticationServiceDatasourceProtocol) {
        self.authenticationService = authenticationService
    }

}

// MARK: - POST Methods

extension AuthenticationRepository {
    func perform(login: AutenticationApi.Endpoints, with data: LoginRequestModel, completion: @escaping (Result<UserAccountModel, BankFailure>) -> Void) {
        authenticationService.perform(login: login, with: data, completion: completion)
    }
}
