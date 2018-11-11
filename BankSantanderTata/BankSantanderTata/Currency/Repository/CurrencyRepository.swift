//
//  CurrencyRepository.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation

final class CurrencyRepository: CurrencyRepositoryProtocol {
    
    private let localDataManager: CurrencyLocalDataManagerProtocol
    private let remoteDataManager: CurrencyRemoteDataManagerProtocol
    
    init(localDataManager: CurrencyLocalDataManagerProtocol,
         remoteDataManager: CurrencyRemoteDataManagerProtocol) {
        self.localDataManager = localDataManager
        self.remoteDataManager = remoteDataManager
    }
    
}
