//
//  RestApi.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 14/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

protocol RestApiProtocol {
    static func doLogin(user: String, password: String, callback: @escaping(_ userAccount: UserAccount?) ->
    Void, error: @escaping () -> Void)
    static func getStatement()
}

class RestApi: RestApiProtocol {
    static func getStatement() {
        
    }
    
    static func doLogin(user: String, password: String, callback: @escaping(_ userAccount: UserAccount?) ->
        Void, error: @escaping () -> Void) {
        let url = Constants.BaseUrl + "/login"
        AF.request(url, method: .post, parameters: ["user": user, "password": password], encoding: URLEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"]).validate().responseObject { (response: DataResponse<User>) in
            
            let user = response.value
            if user?.userAccount != nil {
                callback(user?.userAccount)
            }
        }
        
        
    }
}


