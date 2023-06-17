//
//  MockAutenticationServiceDatasource.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

// MARK: - Success mock AutenticationServiceDatasource

final class MockSuccessAutenticationServiceDatasource: AuthenticationServiceDatasourceProtocol {
    convenience init() {
        self.init(networkService: .init())
    }

    init(networkService: NetworkService<UserAccountModel>) {}

    func perform(login: AutenticationApi.Endpoints, with data: LoginRequestModel, completion: @escaping (Result<UserAccountModel, BankFailure>) -> Void) {
        completion(.success(Seeds.user)
        )
    }
}

// MARK: - Failure network AutenticationServiceDatasource

final class MockFailureNetworkAutenticationServiceDatasource: AuthenticationServiceDatasourceProtocol {

    convenience init() {
        self.init(networkService: .init())
    }

    init(networkService: NetworkService<UserAccountModel>) {}

    func perform(login: AutenticationApi.Endpoints, with data: LoginRequestModel, completion: @escaping (Result<UserAccountModel, BankFailure>) -> Void) {
        completion(.failure(.network(.init())))
    }
}

