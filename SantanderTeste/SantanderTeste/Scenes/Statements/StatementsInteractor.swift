//
//  StatementsInteractor.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 18/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit

protocol StatementsBusinessLogic
{
    func fetchStatements(request: Statements.fetchStatements.Request)
}

protocol StatementsDataStore
{
      var StatementsResponse: Statements.fetchStatements.Response? { get }
}

class StatementsInteractor: StatementsBusinessLogic, StatementsDataStore
{
    
    
    var presenter: StatementsPresentationLogic?
    var worker: StatementsWorker?
    var StatementsResponse: Statements.fetchStatements.Response?

    func fetchStatements(request: Statements.fetchStatements.Request) {
        worker = StatementsWorker()
        worker?.fetchStatements(id: request.id, { [weak self] (response) in
            self?.StatementsResponse = response
            self?.presenter?.presentStatements(response: response)
        })
    }
    
 
}
