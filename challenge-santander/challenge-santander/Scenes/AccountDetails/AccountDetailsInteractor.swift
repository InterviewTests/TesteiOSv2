//
//  AccountDetailsInteractor.swift
//  challenge-santander
//
//  Created by Hugo Ferreira on 18/05/20.
//  Copyright (c) 2020 Hugo Ferreira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AccountDetailsBusinessLogic
{
    func getAccountDetails(userId: Int)
}

protocol AccountDetailsDataStore
{
    //var name: String { get set }
}

class AccountDetailsInteractor: AccountDetailsBusinessLogic, AccountDetailsDataStore
{
    var presenter: AccountDetailsPresentationLogic?
    var worker: AccountDetailsWorkerLogic?
    
    
    func getAccountDetails(userId: Int) {
        
        worker?.requestStatement(userId: userId, completionSuccess: { (response) in
            self.presenter?.setAccountDetails(accountDetails : response)
            return
        }, completionError: { (error) in
            print("error")
            self.presenter?.errorMessage(error.localizedDescription)
            return
        })
    }
    
    func resumeAccountDetails() {
        presenter?.getAccountDetails()
    }
}

