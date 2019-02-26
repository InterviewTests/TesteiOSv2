//
//  StatementsRouter.swift
//  TesteiOSv2
//
//  Created by Capgemini on 24/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

@objc protocol StatementsRoutingLogic
{
    func routeToLogout(segue: UIStoryboardSegue?)
}

protocol StatementsDataPassing
{
    var dataStore: StatementsDataStore? { get }
}

class StatementsRouter: NSObject, StatementsRoutingLogic, StatementsDataPassing
{
    var dataStore: StatementsDataStore?
    
    
    weak var viewController: StatementsViewController?
    
    // MARK: Routing
    func routeToLogout(segue: UIStoryboardSegue?) {
        if let vc = viewController{
            navigateToLogin(source: vc)
        }
//        if let segue = segue {
//            let destinationVC = segue.destination as! LoginViewController
//            var destinationDS = destinationVC.router!.dataStore!
////            passDataToEditOrder(source: dataStore!, destination: &destinationDS)
//        } else {
//            let destinationVC = viewController?.storyboard?.instantiateViewController(withIdentifier: "CreateOrderViewController") as! CreateOrderViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToEditOrder(source: dataStore!, destination: &destinationDS)
//            navigateToEditOrder(source: viewController!, destination: destinationVC)
//        }
    }
    
    // MARK: Navigation
    
    func navigateToLogin(source: StatementsViewController)//, destination: LoginViewController)
    {
        source.navigationController?.popViewController(animated: true)
//        source.show(destination, sender: nil)
    }
    
    // MARK: Passing data
    
//    func passDataToEditOrder(source: ShowOrderDataStore, destination: inout CreateOrderDataStore)
//    {
//        destination.orderToEdit = source.order
//    }
}
