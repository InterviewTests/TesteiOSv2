//
//  MockAuthenticationLocalRepository.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

// MARK: - Mock
import Foundation

final class MockSuccessAuthenticationLocalRepository: AuthenticationLocalRepositoryProtocol {

    func save(user: UserAccountModel) -> UserAccountModel? {
        return user
    }

    func retrieveUser() -> UserAccountModel? {
        let data = Seeds.Json.account.rawValue.data(using: .utf8)
        guard let data = data,
              let user = try? JSONDecoder().decode(UserAccountModel.self, from: data) else {
            return nil
        }
        return user
    }
}

final class MockEmptyAuthenticationLocalRepository: AuthenticationLocalRepositoryProtocol {

    func save(user: UserAccountModel) -> UserAccountModel? {
        return nil
    }

    func retrieveUser() -> UserAccountModel? {
        return nil
    }
}
