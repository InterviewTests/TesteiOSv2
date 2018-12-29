//
//  BankHistoryRouter.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 27/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import UIKit

@objc protocol BankHistoryRouterLogic {
    
    func routeToIntroController(segue: UIStoryboardSegue?)
}

protocol BankHistoryDataPassing {
    
    var dataStore: UserAccountData? { get }
}

class BankHistoryRouter: NSObject, BankHistoryRouterLogic, BankHistoryDataPassing {
    
    var dataStore: UserAccountData?
    weak var viewController: BankHistoryController?
    
    func routeToIntroController(segue: UIStoryboardSegue?) {
        // ...
    }
}
