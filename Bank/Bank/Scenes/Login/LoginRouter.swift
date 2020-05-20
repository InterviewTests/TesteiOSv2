//
//  LoginRouter.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright (c) 2020 Luis Teodoro Junior. All rights reserved.
//


import UIKit

@objc protocol LoginRoutingLogic {
    func routeToStatements()
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    func routeToStatements() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "StatementsViewController") as! StatementsViewController
        var destinationDS = destinationVC.router?.dataStore
        destinationDS?.userLogin = dataStore?.userLogin
        guard let viewController = viewController else { return }
        navigateToStatements(source: viewController, destination: destinationVC)
    }
    
    func navigateToStatements(source: LoginViewController, destination: StatementsViewController) {
        source.present(destination, animated: true, completion: nil)
    }
}
