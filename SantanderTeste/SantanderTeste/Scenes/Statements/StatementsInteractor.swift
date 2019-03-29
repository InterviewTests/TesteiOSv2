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
    func UserData()
}

protocol StatementsDataStore
{
    var user: UserModel! { get set }
    var StatementsResponse: Statements.fetchStatements.Response? { get }
    
}

class StatementsInteractor: StatementsBusinessLogic, StatementsDataStore
{
    var StatementsResponse: Statements.fetchStatements.Response?
    var user: UserModel!
    func UserData() {
        self.presenter?.presentuser(response: user )
    }
    
    var presenter: StatementsPresentationLogic?
    var worker: StatementsWorker?


    func fetchStatements(request: Statements.fetchStatements.Request) {
        worker = StatementsWorker()
        worker?.fetchStatements(id: request.id, { [weak self] (response) in
            self?.StatementsResponse = response
            self?.presenter?.presentStatements(response: response)
        })
    }
    
 
}
