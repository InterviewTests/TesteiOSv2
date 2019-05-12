//
//  StatementsRouter.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//
//

import UIKit

@objc protocol StatementsRoutingLogic {
  
}

protocol StatementsDataPassing {
    var dataStore: StatementsDataStore? { get }
}

class StatementsRouter: NSObject, StatementsRoutingLogic, StatementsDataPassing {
    weak var viewController: StatementsViewController?
    var dataStore: StatementsDataStore?
}
