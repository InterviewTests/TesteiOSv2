//
//  MockAutenticationLocalDatasourceProtocol.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

final class MockSuccessAuthenticationLocalDatasource: AuthenticationLocalDatasourceProtocol {

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
