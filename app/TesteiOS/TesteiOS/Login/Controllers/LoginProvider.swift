//
//  LoginProvider.swift
//  TesteiOS
//
//  Created by Emerson Pereira on 15/01/2019.
//  Copyright © 2019 doug. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginProviderDelegate: NSObjectProtocol {
    func success(user: UserAccount)
    func failure(error: UserError)
    func connectionError()
}

class LoginProvider {
    
    weak var delegate: LoginProviderDelegate?
    
    func makeLogin (username: String, password: String) {
        
        let url = URL(string: "https://bank-app-test.herokuapp.com/api/login")
        
        let parameters = [
            "user": username,
            "password": password
        ]
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                if let responseData = response.data {
                    self.parseResponse(data: responseData)
                }
        }
    }
    
}

extension LoginProvider {
    private func parseResponse(data: Data) {
        do {
            let user = try JSONDecoder().decode(UserModel.self, from: data)
            
            if user.error.code != nil {
                delegate?.failure(error: user.error)
            } else {
                delegate?.success(user: user.userAccount)
            }

        } catch {
            delegate?.connectionError()
        }
    }
}
