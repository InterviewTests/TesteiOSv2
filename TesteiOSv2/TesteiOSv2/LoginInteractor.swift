//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import Foundation

class LoginInteractor: LoginDataStore, LoginBussinessLogic{
    var user: UserAccount?
    
    func validLogin(user: String, password: String) -> Bool {
        return true
    }
    
    func login(user: String, password: String) {
        let userLogin = UserLoginAlamofireGateway()
        userLogin.authLogin(user: user, password: password) { [weak self] userResult in
            guard let strongSelf = self else {return}
            strongSelf.user = userResult
        }
    }
    
    
    
}
