//
//  StatementsRouter.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright (c) 2020 Luis Teodoro Junior. All rights reserved.
//

import UIKit

@objc protocol StatementsRoutingLogic {
    func routeToGetOut()
}

protocol StatementsDataPassing {
    var dataStore: StatementsDataStore? { get }
}

class StatementsRouter: NSObject, StatementsRoutingLogic, StatementsDataPassing {
    weak var viewController: StatementsViewController?
    var dataStore: StatementsDataStore?
    
    func routeToGetOut() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
