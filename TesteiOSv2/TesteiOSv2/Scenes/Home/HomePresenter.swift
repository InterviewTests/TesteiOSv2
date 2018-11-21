//
//  HomePresenter.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

protocol StatementListPresentationLogic {
    func presentStatements(response:HomeModel.Response)
    func presentViewModelUser(response: HomeModel.ResponseUser)
}

class HomePresenter: StatementListPresentationLogic {
    weak var viewController: StatementOutput?
    
    func presentViewModelUser(response: HomeModel.ResponseUser) {
        var agency: String = response.user.agency ?? ""
        if agency.count >= 8 {
            agency.insert("-", at: agency.index(agency.startIndex, offsetBy: 8))
            agency.insert(".", at: agency.index(agency.startIndex, offsetBy: 2))
        }
        
        let account = "\(response.user.bankAccount ?? "")/\(agency)"
        let balance = response.user.balance?.toCurrency() ?? "R$ \(String(describing: response.user.balance))"
        let userViewModel = HomeModel.UserViewModel(name: response.user.name ?? "", account: account, balance: balance)
        viewController?.displayUserViewModel(viewModel:userViewModel)
    }
    
   
    
    func presentStatements(response: HomeModel.Response) {
        viewController?.displayStatements(viewModel:response)
    }
    

    
}
