//
//  LoginRouter.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol ShowUserDataPassing {
    var dataStore: UserAccountDataStore? { get }
}


protocol LoginRoutingLogic {
    func routeToStatementsView()
}


class LoginRouter: NSObject, ShowUserDataPassing, LoginRoutingLogic {
    var dataStore: UserAccountDataStore?
    
    
    
    func routeToStatementsView() {
        <#code#>
    }
}
