//
//  LoginWorker.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
//typealias responseHandler = (_ response: Login.fetchlogin.Response) -> Void
class LoginWorker
{
    typealias responseHandler = (_ user: UserModel?, _ message: String?) -> Void
    func requestUser(user: String, password: String,_ completionHanlder: @escaping (responseHandler)){
        let parameters = [
            "user": user,
            "password": password
        ]
        let endpoint = "\(Config.endPointURL)/api/login"
        Alamofire.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
            let data = response.data!
            do {
                
                let user = try JSONDecoder().decode(UserModel.self, from: data)
                completionHanlder(user, nil)
//                completionHanlder(Login.fetchlogin.Response(LoginResponse: responseLogin, message: nil))
               
                
            }catch let error{
                completionHanlder(nil, error.localizedDescription)
                return
            }
        }
        
    }
}
