//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import UIKit

protocol LoginBusinessLogic {
    func loginUser(request: Login.LoginUser.Request)
}

class LoginInteractor: LoginBusinessLogic {
    var presenter: LoginPresentationLogic?
    var usersWorker = UsersWorker(usersStore: UsersAPI())
    
    func loginUser(request: Login.LoginUser.Request) {
        self.usersWorker.loginUser(user: request.loginFormFields.user, password: request.loginFormFields.password) {(user: User?) in
            let response = Login.LoginUser.Response(user: user)
            self.presenter?.presentUser(response: response)
        }
    }
}
