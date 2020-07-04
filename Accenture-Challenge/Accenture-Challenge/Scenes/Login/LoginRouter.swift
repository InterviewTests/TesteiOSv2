//
//  LoginRouter.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

typealias LoginRouterProtocol = NSObject & LoginRoutingLogic & LoginDataTransfer

protocol LoginRoutingLogic {

}

protocol LoginDataTransfer {
    var dataStore: LoginDataStore? { get set }
}

class LoginRouter: NSObject, LoginDataTransfer {
    
    var dataStore: LoginDataStore?
    weak var viewController: LoginViewController?

}

extension LoginRouter: LoginRoutingLogic {
    
}
