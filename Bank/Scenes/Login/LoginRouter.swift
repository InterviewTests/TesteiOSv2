//
//  LoginRouter.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

@objc protocol LoginRoutingLogic {
    func routeToShowStatement()
    func navigateToShowStatement(source: LoginVC, destination: StatementVC)
}

protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: LoginVC?
    var dataStore: LoginDataStore?
    
    func routeToShowStatement() {
        let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "StatementVC") as! StatementVC
        var destinationDS = destinationVC.router!.dataStore!
        passDataToShowStatement(source: dataStore!, destination: &destinationDS)
        navigateToShowStatement(source: viewController!, destination: destinationVC)
    }
    
    func passDataToShowStatement(source: LoginDataStore, destination: inout StatementDataStore) {
        destination.user = source.user
    }
    
    func navigateToShowStatement(source: LoginVC, destination: StatementVC) {
        source.present(destination, animated: true, completion: nil)
    }
}
