//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.

import UIKit

protocol StatementsBusinessLogic {
    func getStatements()
    func getHeader(data: StatementsModel.Header.Request)
}

protocol StatementsDataStore {
    var userAccount: AccountDetail? { get set }
}

class StatementsInteractor: StatementsBusinessLogic, StatementsDataStore {
    var userAccount: AccountDetail?
    var presenter: StatementsPresentationLogic?
    var worker: StatementsWorker?
        
    func getHeader(data: StatementsModel.Header.Request) {
        let response = StatementsModel.Header.Response(headerDataResponse: data.headerDataResponse)
        presenter?.setupHeader(data: response)
    }
  
    func getStatements() {
        if worker == nil {
            worker = StatementsWorker()
        }
        
        worker?.getStatements(completionSuccess: { (response) in
            DispatchQueue.main.async {
                self.presenter?.presentGetStatements(response: response)
            }
        }, completionFailure: { (error) in
            DispatchQueue.main.async {
                self.presenter?.presenGetStatementsError(error: error)
            }
        })
    }
}
