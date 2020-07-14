//
//  AccountDetailsRouter.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation

@objc protocol AccountDetailsRoutingLogic {
    
}

protocol AccountDetailsDataPassing {
    var dataStore: AccountDetailsDataStore? { get set }
}

class AccountDetailsRouter: NSObject, AccountDetailsRoutingLogic, AccountDetailsDataPassing {
    
    weak var viewController: AccountDetailsViewController?
    var dataStore: AccountDetailsDataStore?
    
    // MARK: Routing
    
    // MARK: Navigation

    // MARK: Passing data

}
