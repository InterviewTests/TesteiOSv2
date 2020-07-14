//
//  AccountDetailsInteractor.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

protocol AccountDetailsBusinessLogic {
    func fetchStatements(_ request: AccountDetails.FetchStatements.Request)
}

protocol AccountDetailsDataStore {
    var userAccount: AccountDetails.AccountInfo? { get set }
}

class AccountDetailsInteractor: AccountDetailsBusinessLogic, AccountDetailsDataStore {
    
    var userAccount: AccountDetails.AccountInfo?
    
    var presenter: AccountDetailsPresentationLogic?
    var worker: AccountDetailsWorker?
    
    func fetchStatements(_ request: AccountDetails.FetchStatements.Request) {
        
    }
    
}
