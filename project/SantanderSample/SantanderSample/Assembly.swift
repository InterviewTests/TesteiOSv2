//
//  Assembly.swift
//  SantanderSample
//
//  Created by Virgilius Santos on 27/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import UIKit
import Swinject

class Assembly {
    
    private var container: Container
    
    lazy var loginVC: LoginViewController?
        = container.resolve(LoginViewController.self)
    
    lazy var detailVC: DetailsViewViewController?
        = container.resolve(DetailsViewViewController.self)
    
    static let shared = Assembly()
    private init() {
        container = Container()
        setupLoginVC()
        setupDetailVC()
    }
    
    func setupLoginVC() {
        container.register(LoginViewController.self) { r in
            let nibName = String(describing: LoginViewController.self)
            let controller = LoginViewController.init(nibName: nibName, bundle: nil)
            
            return controller
        }
    }
    
    func setupDetailVC() {
        container.register(DetailsViewViewController.self) { r in
            let nibName = String(describing: DetailsViewViewController.self)
            let controller = DetailsViewViewController.init(nibName: nibName, bundle: nil)
            
            return controller
        }
    }
}
