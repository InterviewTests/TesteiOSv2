//
//  ShowUserRouter.swift
//  TesteSantader
//
//  Created by Bruno Chen on 06/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

@objc protocol ShowUserRoutingLogic {
}

protocol ShowUserDataPassing {
    var dataStore: ShowUserDataStore? { get }
}

class ShowUserRouter: NSObject, ShowUserRoutingLogic, ShowUserDataPassing {
    
    weak var viewController: ShowUserViewController?
    var dataStore: ShowUserDataStore?
    
    
}
