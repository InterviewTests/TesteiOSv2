//
//  LoginPresenter.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic: AnyObject { }

extension LoginPresenter: LoginPresentationLogic { }

class LoginPresenter: NSObject {
    weak var viewController: LoginDisplayLogic?
    
    init(viewController: LoginDisplayLogic) {
        self.viewController = viewController
    }
}
