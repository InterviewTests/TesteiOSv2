//
//  AccountDetailPresenter.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 16/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

class AccountDetailPresenter: AccountDetailPresenterLogic{
    
    var viewController : AccountDetailViewControllerProceed?
    
    func presentAccountDetails(user: UserAccount , statements: [Statement]) {
        let accountModel = AccountDetailHeaderModel(user: user)
        
        viewController?.updateHeader(account: accountModel)
    }
    
    
}
