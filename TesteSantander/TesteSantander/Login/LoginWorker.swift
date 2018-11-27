//
//  LoginWorker.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 25/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit
import Alamofire
import Security
import SwiftKeychainWrapper

typealias SucessoLogin = (Data) -> Void

struct Account : Decodable {
    
    var agency : String
    var balance : Float
    var bankAccount : String
    var name : String
    var userId : Int
}

struct ResponseAccount : Decodable {
    var userAccount : Account
}

enum GeneralError : Error {
    case serviceConnection
    case emptyFields
    case invalidPassword
    var localizedDescription: String {
        switch self {
        case .serviceConnection:
            return "Estamos melhorando nosso serviço, tente novamente mais tarde"
        case .emptyFields:
            return "Preencha os campos login e password antes de fazer o logon"
        case .invalidPassword:
            return "Password deve contar pelo menos um caracter especial e um caracter em maiusculo"
        }
    }
    
}

protocol LoginWorkerProtocol {
    
    func doAuthentication(_ userLogin:UserLoginInfo,sucess:@escaping (ResponseAccount) -> Void, failure:@escaping (Error) ->Void)
    func saveLogon(loginInfo : UserLoginInfo)
    func fetchLastLogon() -> (UserLoginInfo?)
    
}

class LoginWorker: NSObject, LoginWorkerProtocol {
    
    let USERNAME_KEY = "username"
    let PASSWORD_KEY = "password"
    
    func doAuthentication(_ userLogin:UserLoginInfo,sucess:@escaping (ResponseAccount) -> Void, failure:@escaping (Error) ->Void) {
        
        let url = "https://bank-app-test.herokuapp.com/api/login"
        let parameters : Parameters = ["user": userLogin.user, "password" : userLogin.password]
        
        Alamofire.request(url, method: .post, parameters: parameters, headers: [:]).validate().responseData { (response) in
            
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                let parseResponse: Result<ResponseAccount> = decoder.decodeResponse(from: response)
                if let value = parseResponse.value {
                    self.saveLogon(loginInfo: userLogin)
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
        if let username = KeychainWrapper.standard.string(forKey: self.USERNAME_KEY), let password = KeychainWrapper.standard.string(forKey: self.PASSWORD_KEY) {
            return (username, password)
        }
        return nil
    }
    
     func saveLogon(loginInfo : UserLoginInfo) {
        KeychainWrapper.standard.set(loginInfo.user, forKey: self.USERNAME_KEY)
        KeychainWrapper.standard.set(loginInfo.password, forKey: self.PASSWORD_KEY)
    }
    
}

extension JSONDecoder {
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
        guard response.error == nil else {
            print(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            print("didn't get any data from API")
            return .failure(response.error!)
            //            return .failure(BackendError.parsing(reason:
            //                "Did not get data in response"))
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            print("error trying to decode response")
            print(error)
            return .failure(error)
        }
    }
}
