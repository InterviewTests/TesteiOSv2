//
//  AutenticationLocalRepository.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation


final class AuthenticationLocalRepository {

    // MARK: - Properties

    private let authenticationLocalDataSource: AuthenticationLocalDatasourceProtocol


    // MARK: - Inits

    init(authenticationLocalDataSource: AuthenticationLocalDatasourceProtocol) {
        self.authenticationLocalDataSource = authenticationLocalDataSource
    }

}

// MARK: - Resources

extension AuthenticationLocalRepository: AuthenticationLocalRepositoryProtocol {

    func save(user: UserAccountModel) -> UserAccountModel? {
        return authenticationLocalDataSource.save(user: user)
    }

    func retrieveUser() -> UserAccountModel? {
        return authenticationLocalDataSource.retrieveUser()
    }
}
