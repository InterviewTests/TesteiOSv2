//
//  StatementsRouter.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 18/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit

@objc protocol StatementsRoutingLogic
{
    func routeToLogin()
}

protocol StatementsDataPassing
{
    var dataStore: StatementsDataStore? { get set }
    
}

class StatementsRouter: NSObject, StatementsRoutingLogic, StatementsDataPassing
{
    
   
    weak var viewController: StatementsViewController?
    var dataStore: StatementsDataStore?
    
    // MARK: Routing
    func routeToLogin() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let destinationVC = storyboard.instantiateInitialViewController() as! LoginViewController
        navigateToLogin(source: viewController!, destination: destinationVC)
    }
   
    func navigateToLogin(source: StatementsViewController, destination: LoginViewController) {
        source.show(source, sender: nil)
    }
   
 
}
