//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Lucas Saito on 06/05/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol {
    
}

class LoginInteractor: LoginInteractorProtocol {
    var worker: LoginWorker? = LoginWorker()
    var presenter: LoginPresenterProcotol?
}
