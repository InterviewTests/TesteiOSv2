//
//  LoginRepository.swift
//  Bank-app
//
//  Created by Leonardo Coutinho Santos on 15/09/19.
//  Copyright © 2019 Leocoout.dev. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginRepositoryProtocol {
    func fetchUserInfo(with data: LoginModel.loginInfo,
                       success: @escaping (UserAccount) -> (),
                       failure: @escaping () -> ())
}

class LoginRepository: LoginRepositoryProtocol {
    
    func fetchUserInfo(with data: LoginModel.loginInfo,
                       success: @escaping (UserAccount) -> (),
                       failure: @escaping () -> ()) {
        
        let loginRequest = LoginRequest(data: data)
        BankAPI.requestObject(object: loginRequest, success: { (response: UserAccount) in
            let result = response
            success(result)
        }) { failure in
            //
        }
    }
}
