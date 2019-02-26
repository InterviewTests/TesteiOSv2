//
//  LoginRouter.swift
//  TesteiOSv2
//
//  Created by Capgemini on 22/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

@objc protocol LoginRoutingLogic
{
    func routeToStatements(segue: UIStoryboardSegue?)
}
protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}
class LoginRouter : NSObject , LoginRoutingLogic , LoginDataPassing{
    
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    
    // MARK: Routing
    
    func routeToStatements(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! StatementsViewController
            var destinationDS = destinationVC.router!.dataStore!
        } else {
            
            guard let destinationVC = viewController?.storyboard?
                .instantiateViewController(withIdentifier: "StatementsViewController")
                    as? StatementsViewController else { return }
            var destinationDS = destinationVC.router!.dataStore!
//            destinationVC.router!.dataStore!.user = self.dataStore!.user
            passDataToStatements(source: self.dataStore!, destination: &destinationDS)
            navigateToStatements(source: viewController!, destination: destinationVC)
        }
    }
 
    private func navigateToStatements(source: LoginViewController, destination: StatementsViewController){
        source.show(destination, sender: nil)
    }
    
    
    // MARK: Passing data
    
    func passDataToStatements(source: LoginDataStore, destination: inout StatementsDataStore)
    {
        destination.user = source.user
    }
    
}
