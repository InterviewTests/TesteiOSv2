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
    
    private func handleSuccess(_ data: Data?) -> Result<UserAccount, DomainError> {
        if let model: UserAccount = data?.convertToModel() {
            return .success(model)
        }
        return .failure(.convert)
    }
}

extension AuthClientUseCase: AuthClientUseCaseProtocol {
    public func login(authenticationModel: AuthClientModel, completion: @escaping (Result<UserAccount, DomainError>) -> Void) {
        httpClient.post(to: url, with: authenticationModel.data) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data): completion(self.handleSuccess(data))
            case .failure(_): completion(.failure(.unknown))
            }
        }
    }
}
