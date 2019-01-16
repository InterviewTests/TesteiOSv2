//
//  AccountDetailPresenter.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

class AccountDetailPresenter: AccountDetailPresenterLogic{
    
    weak var viewController : AccountDetailViewController?
    
    func presentAccountDetails(user: UserAccount , statements: [Statement]) {
        
        var accountModel = AccountDetailHeaderModel(user: user)
        
        var accountMount = Double()
        
        var statementModelArray : [AccountStatementModel] = []
        for statement in statements {
            statementModelArray.append(AccountStatementModel.init(statement: statement))
           accountMount += statement.value
        }
        
        
        accountModel.value = MonetaryString.getValueFormmater(value: accountMount)
        
        viewController?.updateHeader(account: accountModel)
        viewController?.updateTableView(statements:statementModelArray)
    }
    
    
}
