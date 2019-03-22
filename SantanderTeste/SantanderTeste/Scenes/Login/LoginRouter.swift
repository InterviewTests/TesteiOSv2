//
//  LoginRouter.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit

protocol LoginRoutingLogic
{
    func routeToStatementDetails(display: Login.fetchlogin.ViewModel.DisplayViewModel)
}

protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
   
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    

    func routeToStatementDetails(display: Login.fetchlogin.ViewModel.DisplayViewModel) {
        let storyboard = UIStoryboard(name: "Statements", bundle: nil)
        let destinationVC = storyboard.instantiateInitialViewController() as! StatementsViewController
        destinationVC.displayLogin = display
        navigateStatements(source: viewController!, destination: destinationVC)
    }
  
   
    // MARK: Navigation
    
    func navigateStatements(source: LoginViewController, destination: StatementsViewController)
      {
      source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: LoginDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
