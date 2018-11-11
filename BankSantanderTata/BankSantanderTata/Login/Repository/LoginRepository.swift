//
//  LoginRepository.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation

final class LoginRepository: LoginRepositoryProtocol {
    
    private let localDataManager: LoginLocalDataManagerProtocol
    private let remoteDataManager: LoginRemoteDataManagerProtocol
    
    init(localDataManager: LoginLocalDataManagerProtocol,
         remoteDataManager: LoginRemoteDataManagerProtocol) {
        self.localDataManager = localDataManager
        self.remoteDataManager = remoteDataManager
    }
    
}
