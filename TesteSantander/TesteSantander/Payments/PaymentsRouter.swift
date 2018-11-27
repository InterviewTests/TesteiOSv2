//
//  PaymentsRouter.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 26/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

protocol PaymentsRouterProtocol {
    func logout(_ controller:UIViewController)
}

class PaymentsRouter: NSObject, PaymentsRouterProtocol {
    
    func logout(_ controller:UIViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

}
