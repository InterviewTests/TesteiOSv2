//
//  StatementRequester.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import Foundation

class StatementRequester {
    // MARK: - Exemplo de Métodos para consumo
    
    static func getAll(completion: @escaping (StatementResponseStruct) -> Void, fail: @escaping (String) -> Void) {
        
        let endpoint = "/statements/\(User.shared.id)"
        let headers = ["Content-Type" : "application/x-www-form-urlencoded"]
        
        
        APIRequester.request(nil, method: .get, on: endpoint, headers: headers) { response in
            switch response.result {
                case .success:
                    guard
                        let data = response.data,
                        let object = try? JSONDecoder().decode(StatementResponseStruct.self, from: data)
                        else { fail("Decode Error"); return }
                    
                    completion(object)
                case .failure(let error):
                    switch error {
                        case .responseStatusCode(let statusCode):
                            fail("Falha ao realizar login.\nErro \(statusCode)")
                        default:
                            fail("Falha de comunicação com o servidor")
                    }
            }
        }
    }
}
