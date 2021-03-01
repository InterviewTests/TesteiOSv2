//
//  StatementsRouter.swift
//  BankApp-Desafio
//
//  Created by Mizia Lima on 2/26/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol StatementsRoutingLogic {
    func logoff()
}

protocol StatementsDataPassing {
    var dataStore: StatementsDataStore? { get }
}

//MARK: Router
class StatementsRouter: NSObject, StatementsRoutingLogic, StatementsDataPassing {
    weak var viewController: StatementsViewController?
    var dataStore: StatementsDataStore?
    
    func logoff() {
        let destinationViewController = LoginViewController()
        UIViewController.replaceRootViewController(viewController: destinationViewController)
    }
}
