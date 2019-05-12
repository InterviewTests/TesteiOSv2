//
//  StatementsInteractor.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

import UIKit

protocol StatementsBusinessLogic {
    func fetchStatements()
    func fetchHeader(data: StatementsModel.Header.Request)
}

protocol StatementsDataStore {
    var userAccount: UserAccount? { get set }
}

class StatementsInteractor: StatementsBusinessLogic, StatementsDataStore {
    var userAccount: UserAccount?
    var presenter: StatementsPresentationLogic?
    var worker: StatementsWorker?
    
    func fetchHeader(data: StatementsModel.Header.Request) {
        let response = StatementsModel.Header.Response(headerData: data.headerData)
        presenter?.setupHeader(data: response)
    }
  
    func fetchStatements() {
        if worker == nil {
            worker = StatementsWorker()
        }
        
        worker?.fetchStatements(completionSuccess: { (response) in
            DispatchQueue.main.async {
                self.presenter?.presentFetchStatements(response: response)
            }
        }, completionFailure: { (error) in
            DispatchQueue.main.async {
                self.presenter?.presentFetchError(error: error)
            }
        })
    }
}
