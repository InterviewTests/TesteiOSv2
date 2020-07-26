//
//  LoginRouter.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol LoginRoutingLogic {
    func routeToDetail()
}

protocol LoginDataPassing {
    var dataSource: LoginDataSource? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    
    var dataSource: LoginDataSource?
    weak var viewController: LoginViewController?
    
    func routeToDetail() {
    }

}
