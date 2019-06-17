//
//  Constants.swift
//  Santander Teste iOS
//
//  Created by Lucas Ferraciolli Assis on 12/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Foundation
import UIKit

struct K {
    struct Colors {
        static let mainBlue = UIColor(named: "main")
        static let lightGray = UIColor(named: "lightGray")
        static let darkGray = UIColor(named: "darkGray")
    }
    
    struct LoginScene {
        // Strings
        static let user = "User"
        static let password = "Password"
        static let login = "Login"
        static let fail = "Fail"
        static let success = "Success"
        static let wrongUserOrPassword = "Your username or password is not correct."
        static let ok = "OK"
        static let connecting = "Connecting..."
        
        //Images
        static let logoImageName = "Logo"
    }
    
    struct AccountScene {
        //Strings
        static let recentes = "Recentes"
        static let conta = "Conta"
        static let saldo = "Saldo"
        
        //Images
        static let logoutImageName = "logout"
    }
}
