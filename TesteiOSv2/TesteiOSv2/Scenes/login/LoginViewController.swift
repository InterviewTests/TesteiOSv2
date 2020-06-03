//
//  LoginViewController.swift
//  TesteiOSv2
//
//  Created by Foliveira on 03/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    var interactor: LoginInteractorProtocol?
    
}

// MARK: - Setup

extension LoginViewController {
    
    func setup() {
        let controller = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        
        controller.interactor = interactor
        interactor.presenter = presenter
        presenter.controller = self
    }
    
}
