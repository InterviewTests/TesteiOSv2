//
//  LoginWorker.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 25/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit
import Alamofire

enum GeneralError : Error {
    case serviceConnection
    var localizedDescription: String {
        switch self {
        case .serviceConnection:
            return "Estamos melhorando nosso serviço, tente novamente mais tarde"
        }
    }
    
}

protocol LoginWorkerProtocol {
    
    func doAuthentication(_ userLogin:UserLoginInfo,sucess:@escaping (ResponseAccount) -> Void, failure:@escaping (Error) ->Void)
    func fetchLastLogon() -> (UserLoginInfo?)
    
}

class LoginWorker: NSObject, LoginWorkerProtocol {
    
    func doAuthentication(_ userLogin:UserLoginInfo,sucess:@escaping (ResponseAccount) -> Void, failure:@escaping (Error) ->Void) {
        
        let url = "https://bank-app-test.herokuapp.com/api/login"
        let parameters : Parameters = ["user": userLogin.user, "password" : userLogin.password]
        
        Alamofire.request(url, method: .post, parameters: parameters, headers: [:]).validate().responseData { (response) in
            
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                let parseResponse: Result<ResponseAccount> = decoder.decodeResponse(from: response)
                if let value = parseResponse.value {
                    sucess(value)
                    return
                }
                failure(GeneralError.serviceConnection)
                
            case .failure(let error):
                failure(GeneralError.serviceConnection)
            }
            
        }
    }
    
    func fetchLastLogon() -> UserLoginInfo? {
        return ("teste", "T@")
    }
    
    
    

}
