//
//  StatementRouter.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

@objc protocol StatementRoutingLogic {
}

protocol StatementDataPassing
{
    var dataStore: StatementDataStore? { get }
}

class StatementRouter: NSObject, StatementRoutingLogic, StatementDataPassing {
    weak var viewController: StatementVC?
    var dataStore: StatementDataStore?
}
