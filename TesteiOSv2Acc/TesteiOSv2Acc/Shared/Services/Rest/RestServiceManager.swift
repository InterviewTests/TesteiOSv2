//
//  RestService.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 24/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//

import Alamofire

class RestService<T: BaseServiceModel> {
    
    func executeServiceRequest(completion: @escaping (_ result:T) -> Void) -> DataRequest{
        
        let url = "https://bank-app-test.herokuapp.com/api/login"
        let method = HTTPMethod.post
        let parameters: [String: Any] = ["User":"test_user", "password": "Test@1"]
        let headers: [String:String] = ["Content-Type":"application/x-www-form-urlencoded"]
        
        let dataRequest = Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding(destination: .httpBody), headers: headers)
        
        dataRequest.responseJSON
        { (response) in
            
            if let json = response.result.value{
                print(json)
            }
            
            if let data = response.data{
                //TODO: handle try catch
                let object: BaseServiceModel = T.parse(jsonData: data)
                
                //completion(
            }
            
        }
        
        return dataRequest
    }
    
}
