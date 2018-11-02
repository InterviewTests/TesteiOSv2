//
//  CurrencyInteractor.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation

final class CurrencyInteractor: CurrencyInteractorProtocol {
    
    fileprivate let repository: CurrencyRepositoryProtocol
    
    init(repository: CurrencyRepositoryProtocol) {
        self.repository = repository
    }
    
}
