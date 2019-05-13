//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.

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
