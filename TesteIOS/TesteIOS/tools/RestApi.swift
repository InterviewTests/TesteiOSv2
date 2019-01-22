//
//  RestApi.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 22/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import AlamofireObjectMapper
import Alamofire

class RestApi: RestApiProtocol {
    func doLogin(user: String, password: String, callback : @escaping (_ userAccount:UserAccount?) -> Void) {
        let url = Constants.BASEURL + "/login"
        Alamofire.request(url, method: .post, parameters: ["user" : user, "password" : password], encoding: JSONEncoding.default, headers: ["Content-Type":"application/x-www-form-urlencoded"]).validate().responseObject { (response: DataResponse<UserAccount>) in
            
            let response = response.result.value
            print(response!)
            callback(response)
        }
    }
    
    func GetStatments(id: String, callback : @escaping (_ statments:Statments?) -> Void) {
        let url = Constants.BASEURL + "/statements/"+id
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Content-Type":"application/x-www-form-urlencoded"]).validate().responseObject { (response: DataResponse<Statments>) in
            
            let response = response.result.value
            print(response!)
            callback(response)
        }
    }

}
