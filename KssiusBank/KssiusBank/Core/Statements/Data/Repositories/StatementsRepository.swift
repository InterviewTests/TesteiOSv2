//
//  StatementsRepository.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//

import Foundation

final class StatementsRepository: StatementsRepositoryProtocol {

    // MARK: - Properties

    private let statementsService: StatementsServiceDatasourceProtocol

    // MARK: - Inits

    init(authenticationService: StatementsServiceDatasourceProtocol) {
        self.statementsService = authenticationService
    }

}

// MARK: - POST Methods

extension StatementsRepository {
    func fetch(statements: BankApi.Endpoints, completion: @escaping (Result<[StatementsModel], StatementsFailure>) -> Void) {
        statementsService.fetch(statements: .statementsRequest){ result in
            switch(result) {
            case .success(let model): completion(.success(model))
            case .failure( _):
                completion(.failure(.network(.init())))
            }
        }
    }
}
