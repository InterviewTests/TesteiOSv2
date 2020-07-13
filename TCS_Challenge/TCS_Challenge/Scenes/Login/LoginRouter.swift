//
//  LoginRouter.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import UIKit

@objc protocol LoginRoutingLogic {
    func routeToAccountDetails(segue: UIStoryboardSegue?)
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    
    func routeToAccountDetails() {
        let accountDetailsVC = AccountDetailsViewController()
        passDataToAccountDetails(source: dataStore as! LoginDataStore, destination: &accountDetailsVC)
        
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(accountDetailsVC, animated: true)
        }
    }

    // MARK: Navigation
    
//    func navigateToAccountDetails(source: LoginViewController, destination: AccountDetailsViewController) {
//        source.show(destination, sender: nil)
//    }
    
    // MARK: Passing data
    
//    func passDataToAccountDetails(source: LoginDataStore, destination: inout AccountDetailsDataStore) {
//
//    }
    
    //func passDataToSomewhere(source: ___VARIABLE_sceneName___DataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
