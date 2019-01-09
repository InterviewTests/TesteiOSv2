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

class StatementService {
    static let instance = StatementService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var title: String {
        get {
            return defaults.value(forKey: TITLE) as! String
        }
        set {
            defaults.set(newValue, forKey: TITLE)
        }
    }
    
    var desc: String {
        get {
            return defaults.value(forKey: DESC) as! String
        }
        set {
            defaults.set(newValue, forKey: DESC)
        }
    }
    
    var date: String {
        get {
            return defaults.value(forKey: DATE) as! String
        }
        set {
            defaults.set(newValue, forKey: DATE)
        }
    }
    
    var value: String {
        get {
            return defaults.value(forKey: VALUE) as! String
        }
        set {
            defaults.set(newValue, forKey: VALUE)
        }
    }
    
    var arrRes = [[String:AnyObject]]()
    
    func getStatement(completion: @escaping CompletionHandler) {
        
       
        AF.request(URL_STATEMENTS, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                let swiftyJsonVar = JSON(response.result.value!)
                //print(swiftyJsonVar)
                
                if let resData = swiftyJsonVar["statementList"].arrayObject {
                    print(resData)
                    self.arrRes = resData as! [[String:AnyObject]]
                    print(self.arrRes)
                }
                if self.arrRes.count > 0 {
                    print("entrou")
                    
                    
                }
                
                
            } else {
                print(response.result.error as Any)
                debugPrint(response.result.error as Any)
            }
            
        }
    }
    
}












