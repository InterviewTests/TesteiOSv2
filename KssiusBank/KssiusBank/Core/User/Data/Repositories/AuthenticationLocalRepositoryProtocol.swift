//
//  AutenticationLocalRepositoryProtocol.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

protocol AuthenticationLocalRepositoryProtocol {
    @discardableResult
    func save(user: UserAccountModel) -> UserAccountModel?
    func retrieveUser() -> UserAccountModel?
}
