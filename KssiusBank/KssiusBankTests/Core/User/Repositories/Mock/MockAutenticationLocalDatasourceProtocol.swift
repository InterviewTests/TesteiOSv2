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
        return Seeds.user
    }

    func retrieveUser() -> UserAccountModel? {
        return Seeds.user
    }
}
