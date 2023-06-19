//
//  AutenticationLocalDatasource.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import KeychainSwift

final class AuthenticationLocalDatasource {

    // MARK: - Properties

    private let keychain: KeychainSwift
    private let userAccountKey = "userAccountKey"

    // MARK: - Inits

    init(keychain: KeychainSwift) {
        self.keychain = keychain
    }

}

// MARK: - Resources

extension AuthenticationLocalDatasource : AuthenticationLocalDatasourceProtocol {

    func save(user: UserAccountModel) -> UserAccountModel? {
        guard let encoded = try? JSONEncoder().encode(user),
              let stringEncoded = String(data: encoded,encoding:.utf8)
        else {
            return nil
        }
        keychain.set(stringEncoded , forKey: userAccountKey)
        return retrieveUser()
    }

    func retrieveUser() -> UserAccountModel? {
        guard let dataUser = keychain.get(userAccountKey)?.data(using: .utf8),
              let decodedUser = try? JSONDecoder().decode(UserAccountModel.self, from: dataUser)
        else {
            return nil
        }
        return decodedUser
    }
}

