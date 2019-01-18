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
    
    var statements = [StatementList]()
    var arrRes = [[String:AnyObject]]()
    
    let defaults = UserDefaults.standard
    
    func findAllChannel(completion: @escaping CompletionHandler) {
        AF.request(URL_STATEMENTS, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                json["statementList"].array?.forEach({(statement)in
                    let title = statement["title"].stringValue
                    let desc = statement["desc"].stringValue
                    let date = statement["date"].stringValue
                    let value = statement["value"].stringValue
                    let statement = StatementList(title: title, desc: desc, date: date, value: value)
                    self.statements.append(statement)
                })
            case .failure( _):
                print(response.result.error as Any)
                debugPrint(response.result.error as Any)
            } // Switcase
        }
        
    } // FIM DA FUN FINDALLCHANNEL
    
    
    
    func getStatement(completion: @escaping CompletionHandler) {
        
       
        AF.request(URL_STATEMENTS, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            if response.result.error == nil {
                
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
    
} // CLASS STATEMENT












