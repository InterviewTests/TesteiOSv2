//
//  MockAuthenticationRepositoryProtocol.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

final class MockSuccessStatementsRepository: StatementsRepositoryProtocol {

    var performLoginCalled = false

    func fetch(statements: BankApi.Endpoints,
               completion: @escaping (Result<[StatementsModel], StatementsFailure>) -> Void) {
        performLoginCalled = true
        completion(.success(Seeds.Statements.statements))
    }
}

final class MockFailureStatementsRepository: StatementsRepositoryProtocol {

    var performLoginCalled = false
    private let statementsFailure: StatementsFailure

    init(statementsFailure: StatementsFailure) {
        self.statementsFailure = statementsFailure
    }

    func fetch(statements: BankApi.Endpoints,
               completion: @escaping (Result<[StatementsModel], StatementsFailure>) -> Void) {
        performLoginCalled = true
        completion(.failure(statementsFailure))
    }
}

