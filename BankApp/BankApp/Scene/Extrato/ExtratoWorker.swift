//
//  ExtratoWorker.swift
//  BankApp
//
//  Created by Victor Lisboa on 20/09/19.
//  Copyright (c) 2019 Victor Lisboa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class ExtratoWorker
{
    func doExtratoWork(completion: @escaping((Extrato.Something.Response)->Void))
    {
        guard let url = URL(string: "https://bank-app-test.herokuapp.com/api/statements/1") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Extrato.Something.Response.self, from: data)
                    if let statementList = response.statementList {
                        
                        DispatchQueue.main.async {
                            completion(response)
                        }
                    }
                    
                }
                catch {
                    print(error)
                }
            }
            }.resume()
    }
}
