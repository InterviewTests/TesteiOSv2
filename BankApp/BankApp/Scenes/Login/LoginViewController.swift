//
//  LoginViewController.swift
//  BankApp
//
//  Created by Tripmatix on 19/02/19.
//  Copyright © 2019 Tripmatix. All rights reserved.
//

import Foundation
import UIKit

protocol LoginDisplayLogic: BaseView {
    func onLoginSuccess()
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: (LoginRouterLogic & AccountDataPassing)?
    
    func onLoginSuccess() {
        router?.openEntriesScene()
    }
    
    

}








