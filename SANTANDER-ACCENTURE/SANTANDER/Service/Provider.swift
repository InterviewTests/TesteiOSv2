//
//  Provider.swift
//  SANTANDER
//
//  Created by Maíra Preto on 29/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import Foundation
import Alamofire

class Provider {
        
    func getDataFromHeroKu(completion: @escaping ([StatementList]?) -> Void) {
        
        let url = API.baseURL + API.statement
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                guard let data = response.data else {
                    completion(nil)
                    return
                }
                do {
                    let result = try JSONDecoder().decode(MarvelHeader.self, from: data)
                    completion(result.statementList)
                }catch {
                    completion(nil)
                }
            }else {
                completion(nil)
                return
            }
        }
        
    }
    
    let base_url2 = "https://bank-app-test.herokuapp.com/api/login"
    
    func postUser(completion: @escaping (Any) -> Void) {
        
        let parameters: Parameters = ["user": "test_user", "password" : "Test@1"]
        
        Alamofire.request(URL.init(string: base_url2)!, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result {
                
            case .success(_):
                if let json = response.value
                {
                    //print(json)
                    completion(json)
                    
                }
                break
            case .failure(let error):
                print(error)
                
                break
            }
            
        }
        
    }
    
}




