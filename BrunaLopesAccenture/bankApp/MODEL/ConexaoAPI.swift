//
//  ConexaoAPI.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 08/07/19.
//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginService {
    
    func login(user:String, password: String, completion:@escaping (Usuario) -> Void)

}

class ConexaAPI: LoginService {
    
    func login(user: String, password: String, completion: @escaping (Usuario) -> Void) {
        
        let link = "https://bank-app-test.herokuapp.com/api/login"
        let parametros: Parameters = ["user" : "test_user",
                                      "password" : "Test@1"]
        
        AF.request(link, method: .post, parameters: parametros).responseData { response in
            
            let decoder = JSONDecoder()
            let model = try! decoder.decode(UsuarioResponse.self, from: response.data!)
            completion(model.usuario)
            
        }
    }
}
