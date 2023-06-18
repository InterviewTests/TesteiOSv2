//
//  StatementsServiceDatasource.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

final class StatementsServiceDatasource: StatementsServiceDatasourceProtocol {

    // MARK: - Properties
    private let networkService: NetworkService<[StatementsModel]>

    // MARK: - Inits
    init(networkService: NetworkService<[StatementsModel]>) {
        self.networkService = networkService
    }
}

// MARK: - Operations
extension StatementsServiceDatasource {

    func fetch(statements: BankApi.Endpoints, completion: @escaping (Result<[StatementsModel], BankFailure>) -> Void) {
        networkService.request(endpoint: statements.endpoint) { result in
            switch(result) {
            case .success(let model):
                DispatchQueue.main.async {
                    completion(.success(model))
                }
            case .failure( _):
                DispatchQueue.main.async {
                    completion(.failure(.network(.init())))
                }
            }
        }
    }
}
