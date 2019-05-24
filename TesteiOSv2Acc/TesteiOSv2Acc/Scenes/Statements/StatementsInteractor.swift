//
//  StatementsInteractor.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 21/05/19.
//  Copyright (c) 2019 Marlon Santos Heitor. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementsBusinessLogic
{
    func loadStatements(request: Statements.LoadStatements.Request)
    func loadCustomerData(request: Statements.LoadCustomerData.Request)
    func logout(request: Statements.Logout.Request)
}

protocol StatementsDataStore
{
    var userAccount: UserAccount? { get set }
}

class StatementsInteractor: StatementsBusinessLogic, StatementsDataStore
{
    
    var presenter: StatementsPresentationLogic?
    var worker: StatementsWorker?
    var userAccount: UserAccount?
    
    // MARK: - Presenter methods
    
    func loadStatements(request: Statements.LoadStatements.Request)
    {
        worker = StatementsWorker()
        if let response = worker?.loadStatements(){
            presenter?.presentStatements(response: response)
        }
    }
    
    func logout(request: Statements.Logout.Request) {
        let response = Statements.Logout.Response()
        presenter?.presentLoggedOut(response: response)
    }
    
    func loadCustomerData(request: Statements.LoadCustomerData.Request) {
        let response = Statements.LoadCustomerData.Response()
        presenter?.presentCustomerData(response: response)
    }
}
