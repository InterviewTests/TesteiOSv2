//
//  MockStatementsServiceDatasource.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

// MARK: - Success mock StatementsServiceDatasource

final class MockSuccessStatementsServiceDatasource: StatementsServiceDatasourceProtocol {
    convenience init() {
        self.init(networkService: .init())
    }

    init(networkService: NetworkService<[StatementsModel]>) {}

    func fetch(statements: BankApi.Endpoints,  completion: @escaping (Result<[StatementsModel], BankFailure>) -> Void) {
        completion(.success(Seeds.Statements.statements)
        )
    }
}

// MARK: - Failure network AutenticationServiceDatasource

final class MockFailureNetworkStatementsServiceDatasource: StatementsServiceDatasourceProtocol {

    convenience init() {
        self.init(networkService: .init())
    }

    init(networkService: NetworkService<[StatementsModel]>) {}


    func fetch(statements: BankApi.Endpoints, completion: @escaping (Result<[StatementsModel], BankFailure>) -> Void) {
        completion(.failure(.network(.init())))
    }
}

