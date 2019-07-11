//
//  BancoAPI.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 08/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import Foundation
import Alamofire

protocol LoginService {
    func login(user: String, password: String, completion:@escaping (Usuario) -> Void)
}

class BancoAPI: LoginService {
    
    func buscaLancamentos(userID: Int, completion: @escaping ([Lancamento])->Void){
        let endpoint = "https://bank-app-test.herokuapp.com/api/statements/\(userID)"
        AF.request(endpoint).responseData{ response in
            let decoder = JSONDecoder()
            let model = try! decoder.decode(LancamentoResponse.self, from: response.data!)
            completion(model.lancamento)
            
        }
    }
    
    
    func login(user: String, password: String, completion: @escaping (Usuario) -> Void) {
        let endpoint = "https://bank-app-test.herokuapp.com/api/login"
        let params: Parameters = [
            "user": "test_user",
            "password": "Test@1"
        ]
        
        AF.request(endpoint, method: .post, parameters: params).responseData { response in
            
            let decoder = JSONDecoder()
            let model = try! decoder.decode(UsuarioResponse.self, from: response.data!)
            completion(model.usuario)
        }
        
    }
    
}

