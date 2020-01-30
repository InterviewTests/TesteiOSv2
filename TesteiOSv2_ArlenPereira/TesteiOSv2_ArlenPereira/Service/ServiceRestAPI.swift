//
//  LoginRestAPI.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServiceRestAPI: ServiceStoreProtocol {

    let errorMessage = "message"
    let urlBase = "https://bank-app-test.herokuapp.com/api"

    func loginRequest(username: String, password: String, completionHandler: @escaping (() throws -> LoginAPIModel) -> Void) {
        
        let urlLogin = "\(urlBase)/login"
        let headers: HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]
        
        var parameters = [String: Any]()
        if !username.isEmpty && !password.isEmpty {
            parameters = ["user": username, "password": password]
        }
        
        Alamofire.request(urlLogin, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (responseData) in
            var errorCode: String = ""
            var errorMsg: String = ""
            var data: [LoginAPIRequest] = []
            
            if responseData.error != nil {
                let error = responseData.error! as NSError
                errorCode = String(error.code)
                errorMsg = error.description
            }

            
            if responseData.result.value != nil {
                let swiftyJsonVar = JSON(responseData.result.value!)
                if !swiftyJsonVar[self.errorMessage].exists() {
                    errorCode = ""
                    errorMsg = swiftyJsonVar[self.errorMessage].stringValue
                }
                
                 data.append(LoginAPIRequest(json: swiftyJsonVar))
            }
            
            let result = LoginAPIModel(data: data, message: errorMsg, code: errorCode)
            completionHandler { result }
        }
    }
    
    func statementsRequest(completionHandler: @escaping (() throws -> StatementsAPIModel) -> Void) {
        
        let urlStatements = "\(urlBase)/statements/1"
        
        Alamofire.request(urlStatements, method: .get, encoding: URLEncoding.default).responseJSON { (responseData) in
            var errorCode: String = ""
            var errorMsg: String = ""
            var data: StatementsAPIRequest?
            
            if responseData.error != nil {
                let error = responseData.error! as NSError
                errorCode = String(error.code)
                errorMsg = error.description
            }
            
            if responseData.result.value != nil {
                let swiftyJsonVar = JSON(responseData.result.value!)
                if !swiftyJsonVar[self.errorMessage].exists() {
                    errorCode = ""
                    errorMsg = swiftyJsonVar[self.errorMessage].stringValue
                }
                
                var dataResultStatements: [JSON] = []
                for (key, value) in swiftyJsonVar {
                    if key.contains("statementList") {
                        if !value.isEmpty {
                            dataResultStatements.append(value)
                        }
                    }
                    data = StatementsAPIRequest(statements: dataResultStatements)
                }
            }
            
            let result = StatementsAPIModel(data: data, message: errorMsg, code: errorCode)
            completionHandler { result }
        }
    }
}


