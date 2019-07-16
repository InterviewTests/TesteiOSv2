//
//  API.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/14/19.
//  Copyright © 2019 b. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginApi {
    func login(user: String, password: String, completion:@escaping (Cliente) -> Void)

}

class API: LoginApi {
    func login(user: String, password: String, completion: @escaping (Cliente) -> Void) {
        let endpoint = "https://bank-app-test.herokuapp.com/api/login"
        let params: Parameters = [
            "user": "test_user",
            "password": "Test@1"]
        
        AF.request(endpoint, method: .post, parameters: params).responseData { response in
            
            let decoder = JSONDecoder()
            let model = try!
                decoder.decode(UsuarioResponse.self, from: response.data!)
            completion(model.usuario)
        }
    }
    
}
