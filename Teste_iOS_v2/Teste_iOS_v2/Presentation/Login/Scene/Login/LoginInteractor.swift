//
//  LoginInteractor.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 30/07/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic: AnyObject { }

extension LoginInteractor: LoginBusinessLogic { }

class LoginInteractor: NSObject {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorkerLogic?
    
    init(presenter: LoginPresentationLogic, worker: LoginWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}
