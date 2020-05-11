//
//  LoginFormRoutingLogic.swift
//  TesteSantader
//
//  Created by Bruno Chen on 06/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
import UIKit

@objc protocol LoginFormRoutingLogic {
    func routeToShowUser(segue: UIStoryboardSegue?)
}

protocol LoginFormDataPassing {
    var dataStore: LoginFormDataStore? { get }
}

class LoginFormRouter: NSObject, LoginFormRoutingLogic, LoginFormDataPassing {
    
    weak var viewController: LoginFormViewController?
    var dataStore: LoginFormDataStore?
    
    // MARK: - Routing
    
    func routeToShowUser(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! ShowUserViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToShowUser(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(identifier: "ShowUserViewController") as! ShowUserViewController
            var destinationDS = destinationVC.router!.dataStore!
            passDataToShowUser(source: dataStore!, destination: &destinationDS)
            navigationToShowUser(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: - Navigation
    
    func navigationToShowUser(source: LoginFormViewController, destination: ShowUserViewController) {
        
    }
    
    // MARK: - Passing data
    
    func passDataToShowUser(source: LoginFormDataStore, destination: inout ShowUserDataStore) {
        destination.user = source.user
    }
    
}
