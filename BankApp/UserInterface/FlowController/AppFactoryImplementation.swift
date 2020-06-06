//
//  AppFactoryImplementation.swift
//  UserInterface
//
//  Created by Estaife Lima on 06/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import UIKit

public class AppFactoryImplementation: AppFactory {
    
    public init() { }
    
    public func makeLoginViewController() -> LoginViewController {
        return LoginViewController()
    }
    
    public func makeBalanceViewController() -> UIViewController {
        return UIViewController()
    }
}
