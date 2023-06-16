//
//  LoginWorker.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginWorkerProtocol {
    func login(username: String, password: String, completion: @escaping (Result<UserAccountModel, UserFailure>) -> Void)
}

final class LoginWorker{

    // MARK: - Properties

    private let authenticaionRepository: AuthenticationRepositoryProtocol

    // MARK: - Inits

    init(authenticaionRepository: AuthenticationRepositoryProtocol) {
        self.authenticaionRepository = authenticaionRepository
    }
}

extension LoginWorker: LoginWorkerProtocol {
    func login(username: String, password: String, completion: @escaping (Result<UserAccountModel, UserFailure>) -> Void) {
        authenticaionRepository.perform(login: .loginRequest,
                                        with: .init(username: username, password: password),
                                        completion: completion)
    }
}

