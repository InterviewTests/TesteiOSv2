//
//  LoginRouter.swift
//  BankApp
//
//  Created by Tripmatix on 19/02/19.
//  Copyright © 2019 Tripmatix. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRouterLogic: AccountDataPassing {
    func openEntriesScene()
}

protocol AccountDataPassing {
    var dataStore: LoginDataStore? {get}
}

class LoginRouter: NSObject, LoginRouterLogic, AccountDataPassing {
    
    var dataStore: LoginDataStore?
    weak var view: UIViewController?
    
    func openEntriesScene() {
        
    }
}
