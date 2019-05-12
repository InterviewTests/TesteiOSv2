//
//  LoginRouter.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

import UIKit

@objc protocol LoginRoutingLogic {
    func routeToShowStatement(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
  
    // MARK: Routing
  
    func routeToShowStatement(segue: UIStoryboardSegue?) {
        if let segue = segue {
            guard let destinationVC = segue.destination as? StatementsViewController,
                  var destinationDS = destinationVC.router?.dataStore,
                  let dataStore = self.dataStore else { return }
            passDataToStatements(source: dataStore, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let destinationVC = storyboard.instantiateViewController(withIdentifier: "StatementsViewController") as? StatementsViewController,
                  var destinationDS = destinationVC.router?.dataStore,
                  let dataStore = self.dataStore,
                  let loginViewController = viewController else { return }
            passDataToStatements(source: dataStore, destination: &destinationDS)
            navigateToStatements(source: loginViewController, destination: destinationVC)
        }
    }

    // MARK: Navigation
  
    func navigateToStatements(source: LoginViewController, destination: StatementsViewController) {
        source.show(destination, sender: nil)
    }
  
    // MARK: Passing data
  
    func passDataToStatements(source: LoginDataStore, destination: inout StatementsDataStore) {
        destination.userAccount = source.userAccount
    }
}
