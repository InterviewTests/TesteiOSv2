//
//  AuthClientUseCaseSpy.swift
//  PresenterTests
//
//  Created by Estaife Lima on 04/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Domain

class AuthClientUseCaseSpy: AuthClientUseCaseProtocol {
    var authClientModel: AuthClientModel?
    
    func login(authenticationModel: AuthClientModel, completion: @escaping (Result<UserAccountResponse, DomainError>) -> Void) {
        self.authClientModel = authenticationModel
    }
}
