//
//  MockAutenticationServiceDatasource.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

// MARK: - Success mock AutenticationServiceDatasource

final class MockSuccessAutenticationServiceDatasource: AuthenticationServiceDatasourceProtocol {
    init(networkService: NetworkService<UserAccountModel>) {}

    func perform(login: AutenticationApi.Endpoints, with data: LoginRequestModel, completion: @escaping (Result<UserAccountModel, BankFailure>) -> Void) {
        completion(.success(UserAccountModel(userId: "",
                                             email: "Marquis_Gibson@hotmail.com",
                                             cpf: "",
                                             name: "",
                                             accountNumber: "",
                                             agency: "",
                                             balance: ""))
        )
    }
}

// MARK: - Failure network AutenticationServiceDatasource

final class MockFailureNetworkAutenticationServiceDatasource: AuthenticationServiceDatasourceProtocol {
    init(networkService: NetworkService<UserAccountModel>) {}

    func perform(login: AutenticationApi.Endpoints, with data: LoginRequestModel, completion: @escaping (Result<UserAccountModel, BankFailure>) -> Void) {
        completion(.failure(.network(.init())))
    }
}
