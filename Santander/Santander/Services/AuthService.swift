//
//  AuthService.swift
//  SantanderTecnologia
//
//  Created by ely.assumpcao.ndiaye on 04/01/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var userName: String {
        get {
            return defaults.value(forKey: USER_NAME) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_NAME)
        }
    }
    
    var userAgency: String {
        get {
            return defaults.value(forKey: USER_AGENCY) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_AGENCY)
        }
    }
    
    var userBalance: String {
        get {
            return defaults.value(forKey: USER_BALANCE) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_BALANCE)
        }
    }
    
    var userBankAccount: String {
        get {
            return defaults.value(forKey: USER_BANKACCOUNT) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_BANKACCOUNT)
        }
    }
    
    var userId: String {
        get {
            return defaults.value(forKey: USER_ID) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_ID)
        }
    }
    
    
    func loginUser(user: String, pass: String, completion: @escaping CompletionHandler) {
        
        let parameters = [
            "user": user,
            "password": pass
        ]
        
        AF.request(URL_LOGIN, method: .post, parameters: parameters, encoding:  URLEncoding.httpBody).responseJSON { (response:DataResponse<Any>) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                let json = try! JSON(data: data)
                self.userName = json["userAccount"]["name"].stringValue
                self.userAgency = json["userAccount"]["agency"].stringValue
                self.userBalance = json["userAccount"]["balance"].stringValue
                self.userBankAccount = json["userAccount"]["bankAccount"].stringValue
                self.userId = json["userAccount"]["userId"].stringValue
                
                self.isLoggedIn = true
                print (self.userName, self.userAgency, self.userBalance, self.userBankAccount, self.userId)
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}












