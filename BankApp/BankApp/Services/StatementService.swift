//
//  StatementService.swift
//  BankApp
//
//  Created by Marcus Titton on 20/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import Foundation

class StatementService: StatementDataProtocol {
    
    //Faz a chamada para a API de captura de extrato
    func getStatements(_ id: Int, completionHandler: @escaping ([StatementUser]) -> Void) {
        var request = URLRequest(url: URL(string: "https://bank-app-test.herokuapp.com/api/statements/\(id)")!)
        request.httpMethod = "GET"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
  
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                print(request)
                
                //Verifica o response
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200{ //Verifica se a consulta deu certo
                        
                        print("Entrou aqui")
                        guard let data = data else {return}
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                if let statementList = json["statementList"] as? [[String: Any]] {
                                    let statementReturn = try JSONSerialization.data(withJSONObject: statementList, options: [])
                                    let decoder = JSONDecoder()
                                    let retorno = try decoder.decode([StatementUser].self, from: statementReturn)

                                    DispatchQueue.main.async {
                                        completionHandler(retorno)
                                    }
                                }
                            }
                        } catch let jsonErr {
                            print("Erro ao serializar o JSON", jsonErr)
                        }
                    }
                }
            }
        })
        
        task.resume()
    }
}
