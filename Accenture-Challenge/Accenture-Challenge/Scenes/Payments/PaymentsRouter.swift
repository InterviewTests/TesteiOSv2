//
//  PaymentsRouter.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

typealias PaymentsRouterProtocol = NSObject & PaymentsDataTransfer & PaymentsRoutingLogic

protocol PaymentsRoutingLogic {
    
}

protocol PaymentsDataTransfer {
    
}

class PaymentsRouter: PaymentsDataTransfer {
    
}

extension PaymentsRouter: PaymentsRoutingLogic {
    
}
