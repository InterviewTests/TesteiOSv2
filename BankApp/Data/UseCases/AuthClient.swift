//
//  AuthClient.swift
//  Data
//
//  Created by Estaife Lima on 30/05/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation
import Domain

public final class AuthClientUseCase {
    private let url: URL
    private let httpClient: HTTPPostClient
    
    init(url: URL, httpClient: HTTPPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
}

extension AuthClientUseCase: AuthClientUseCaseProtocol {
    public func login(authenticationModel: AuthClientModel, completion: @escaping (Result<UserAccount, DomainError>) -> Void) {
        httpClient.post(to: url, with: authenticationModel.data) { result in
            switch result {
            case .success(let data):
                if let model: UserAccount = data.convertToModel() {
                    completion(.success(model))
                } else {
                    completion(.failure(.convert))
                }
            case .failure(_): completion(.failure(.unknown))
            }
        }
    }
}
