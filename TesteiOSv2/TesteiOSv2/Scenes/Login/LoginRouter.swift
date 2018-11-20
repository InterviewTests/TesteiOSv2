//
//  LoginRouter.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 18/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

class LoginRouter: NSObject {
    weak var loginViewController: LoginViewController!
    
    func goToHomeScreen(){
        loginViewController.performSegue(withIdentifier:SegueName.goHome.rawValue, sender:nil)
    }
}
