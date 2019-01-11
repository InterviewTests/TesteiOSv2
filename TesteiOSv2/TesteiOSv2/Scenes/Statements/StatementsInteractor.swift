//
//  StatementsInteractor.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import UIKit

protocol StatementsBusinessLogic {
    func getStatements(request: Statements.GetStatements.Request)
}

class StatementsInteractor: StatementsBusinessLogic {
    var presenter: StatementsPresentationLogic?
    var statementsWorker = StatementsWorker(statementsStore: StatementsAPI())
    
    func getStatements(request: Statements.GetStatements.Request) {
        self.statementsWorker.getStatements() {(statements: [Statement]?) in
            let response = Statements.GetStatements.Response(statements: statements)
            self.presenter?.showStatements(response: response)
        }
    }
}
