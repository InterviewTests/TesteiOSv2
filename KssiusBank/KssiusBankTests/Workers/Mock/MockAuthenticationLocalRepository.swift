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
        return Seeds.user
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
