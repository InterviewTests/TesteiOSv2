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
    func request_Statements(_ completionHanlder: @escaping ()-> Void){
        Alamofire.request("https://bank-app-test.herokuapp.com/api/statements/1").responseJSON { (response) in
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
    
    func request_User(_ completionHanlder: @escaping ()-> Void){
        Alamofire.request("https://bank-app-test.herokuapp.com/api/statements/1").responseJSON { (response) in
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
}
