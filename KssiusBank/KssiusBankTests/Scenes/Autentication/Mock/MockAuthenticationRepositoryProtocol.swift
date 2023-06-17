//
//  MockAuthenticationRepositoryProtocol.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

final class MockSuccessAuthenticationRepository: AuthenticationRepositoryProtocol {

    var performLoginCalled = false

    func perform(login: BankApi.Endpoints, with data: LoginRequestModel,
                 completion: @escaping (Result<UserAccountModel, UserFailure>) -> Void) {
        performLoginCalled = true
        completion(.success(Seeds.user))
    }
}

final class MockFailureAuthenticationRepository: AuthenticationRepositoryProtocol {

    var performLoginCalled = false
    private let userFailure: UserFailure

    init(userFailure: UserFailure) {
        self.userFailure = userFailure
    }

    func perform(login: BankApi.Endpoints, with data: LoginRequestModel,
                 completion: @escaping (Result<UserAccountModel, UserFailure>) -> Void) {
        performLoginCalled = true
        completion(.failure(userFailure))
    }
}

