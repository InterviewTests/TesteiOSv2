//
//  AccountDetailInteractor.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

class AccountDetailInteractor : AccountDetailBussinessLogic, AccountDetailDataStore{
    
    var user: UserAccount?
    
    var statements: [Statement]?
    
    var presenter : AccountDetailPresenterLogic?
    
    func updateUserAccountDetail(user: UserAccount) {
        self.user = user
        self.fetchStatements()
    }
    
    func fetchStatements() {
        StatementAlamofireGateway().fecthStatements(page: "1") { result in
            self.statements = result.statementList
            guard let user = self.user else{return}
            self.presenter?.presentAccountDetails(user: user, statements: result.statementList)
        }
    }
    
}
