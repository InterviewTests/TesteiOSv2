//
//  BankAPI.swift
//  TesteiOSv2
//
//  Created by Capgemini on 23/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//
import Foundation

class BankAPI : BankProtocol, BankUtilityProtocol {
    
    private let URL_SERVER = "https://bank-app-test.herokuapp.com/api"
    
    
    func requestUser(_ _request: FetchUsers.UserFormFields,completionHandler: @escaping (User?, String?) -> Void) {
        if let url = URL(string: "\(URL_SERVER)/login") ,
            let data = _request.getData() {
            request(url: url, body: data, method: .POST) { (success, response) in
                if let dic = self.getDictionaryFromJSON(response){
                    if let userAccount : [String:NSObject] = dic["userAccount"] as? [String:NSObject],
                        userAccount.count > 0 {
                        DispatchQueue.main.async {
                            completionHandler(User(userAccount), nil)
                        }
                        return
                        
                    }else if let error :  [String:NSObject] = dic["error"] as?  [String:NSObject],
                        let errorMessage = error["message"] as? String {
                        DispatchQueue.main.async {
                            completionHandler(nil, errorMessage)
                        }
                        return
                    }
                }
                DispatchQueue.main.async {
                    completionHandler(nil, "Erro ao buscar dad")
                }
            }
        }
    }
    
    func requestStatements(_ _request: ListStatements.FetchStatements.Request, completionHandler: @escaping ([Statement]) -> Void) {
        if let url = URL(string: "\(URL_SERVER)/statements/\(_request.user.userId)") {
            request(url: url, body: nil, method: .GET) { (success, response) in
                var statementListRsp = [Statement]()
                if let dic = self.getDictionaryFromJSON(response){
                    if let statementList : [[String:NSObject]] = dic["statementList"] as? [[String:NSObject]] {
                        for s in statementList{
                            statementListRsp.append(Statement(s))
                        }
                    }
                }
                DispatchQueue.main.async {
                    completionHandler(statementListRsp)
                }
            }
        }
    }
}
