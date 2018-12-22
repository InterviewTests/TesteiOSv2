//
//  NetWorkManager.swift
//  TesteiOSSantander
//
//  Created by julio.c.tanchiva on 12/19/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

var dataStatements: Statements!
var sata: [statementList]!
var dataUser: User!
class NetworkManager{
    
    static let shared = NetworkManager()
    var parameters: [String: String] = [:]
    func formtLogin(user: String, password: String){
         self.parameters = [
            "user": user,
            "password": password
        ]
    }
    
    func request_User(_ completionHanlder: @escaping ()-> Void){
       let endpoint = "\(Config.shared.endPointURL)/api/login"
        Alamofire.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
            let data = response.data!
            do {
                
                let r = try JSONDecoder().decode(User.self, from: data)
                dataUser = r
                completionHanlder()
                
            }catch let error{
                print(error)
                return
            }
        }
        
    }
    
    
    func request_Statements(_ completionHanlder: @escaping ()-> Void){
        let endpoint = "\(Config.shared.endPointURL)/api/statements/\(dataUser.userAccount.userId)"
        Alamofire.request(endpoint).responseJSON { (response) in
            let data = response.data!
            do {
          
                let r = try JSONDecoder().decode(Statements.self, from: data)
                dataStatements = r
                completionHanlder()
                
            }catch let error{
                print(error)
                return
            }
        }
    }
    
    
}
