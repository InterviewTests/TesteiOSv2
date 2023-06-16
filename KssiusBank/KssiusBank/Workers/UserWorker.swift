//
//  UserWorker.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//

import Foundation

protocol UserWorkerLogic {
    @discardableResult
    func save(user: UserAccountModel) -> UserAccountModel?
    func retrieveUser() -> UserAccountModel?
}

final class UserWorker {

    // MARK: - Properties

    private let authenticationLocalRepository: AuthenticationLocalRepositoryProtocol

    // MARK: - Inits

    init(authenticationLocalRepository: AuthenticationLocalRepositoryProtocol) {
        self.authenticationLocalRepository = authenticationLocalRepository
    }

}

// MARK: - Resources

extension UserWorker: UserWorkerLogic {

    func save(user: UserAccountModel) -> UserAccountModel? {
        return authenticationLocalRepository.save(user: user)
    }

    func retrieveUser() -> UserAccountModel? {
        return authenticationLocalRepository.retrieveUser()
    }
}
