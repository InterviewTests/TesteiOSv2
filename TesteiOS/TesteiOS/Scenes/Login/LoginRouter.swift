//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.

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

    
    func routeToShowStatement(segue: UIStoryboardSegue?) {
        if let segue = segue {
            guard let destinationVC = segue.destination as? StatementsViewController,
                var destinationDS = destinationVC.router?.dataStore,
                let dataStore = self.dataStore else { return }
            passDataToStatements(source: dataStore, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let destinationVC = storyboard.instantiateViewController(withIdentifier: Constants.Identifiers.statementsViewController) as? StatementsViewController,
                var destinationDS = destinationVC.router?.dataStore,
                let dataStore = self.dataStore,
                let loginViewController = viewController else { return }
            passDataToStatements(source: dataStore, destination: &destinationDS)
            navigateToStatements(source: loginViewController, destination: destinationVC)
        }
    }
    
    func navigateToStatements(source: LoginViewController, destination: StatementsViewController) {
        source.show(destination, sender: nil)
    }
    
    func passDataToStatements(source: LoginDataStore, destination: inout StatementsDataStore) {
        destination.userAccount = source.userAccount
    }
}

