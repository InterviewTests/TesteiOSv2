//
//  LoginRouter.swift
//  Bank-app
//
//  Created by Leonardo Coutinho Santos on 15/09/19.
//  Copyright © 2019 Leocoout.dev. All rights reserved.
//

import Foundation
import UIKit
import Hero

protocol LoginRouterProtocol {
    func navigateToStatementScreen(controller: UIViewController, data: UserAccount)
}

class LoginRouter: LoginRouterProtocol {
    
    func navigateToStatementScreen(controller: UIViewController, data: UserAccount) {
        let statementList = StatementsViewController(nibName: "StatementsViewController", bundle: nil)
        controller.navigationController?.present(statementList, animated: true, completion: nil)
    }
}
