//
//  BankAPI.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import Foundation

class BankAPI: BankStoreProtocol {
    
    func authenticate(user: String, password: String, completion: @escaping(User?, BankError?) -> Void) throws {
        
        let param = NSMutableDictionary()
        param.setValue(user, forKey: "user")
        param.setValue(password, forKey: "password")
        
        requestData(method: .post, request: "\(Constants.urlAPI)login", paramRequest: param, completion: { (data) in
            switch(data)
            {
            case .success(let dataResponse):
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                    guard let jsonDictionary = jsonObject as? [String: Any] else {
                        return
                    }
                    var total = 0
                    for (key,values) in jsonDictionary
                    {
                        total = (values as! [String: AnyObject]).count
                        if(key == "error" && total > 0) {
                            let obj = try JSONDecoder().decode(ResponseError.self, from: try! JSONSerialization.data(withJSONObject: values, options: JSONSerialization.WritingOptions.prettyPrinted))
                            completion(nil, .authenticationError(obj.message))
                            break
                        }
                        else if(key == "userAccount" && total > 0) {
                            let obj = try JSONDecoder().decode(User.self, from: try! JSONSerialization.data(withJSONObject: values, options: JSONSerialization.WritingOptions.prettyPrinted))
                            completion(obj, nil)
                            break
                        }
                    }
                }
                catch let error
                {
                    completion(nil, .authenticationError(error.localizedDescription))
                }
            case .failed(let error):
                completion(nil, .authenticationError(error.localizedDescription))
            }
        })
    }
    
    func getStatements(userId: Int, completion: @escaping([Statement]?, BankError?) -> Void) throws {
        requestData(method: .get, request: "\(Constants.urlAPI)statements/\(userId)", paramRequest: nil, completion: { (data) in
            switch(data)
            {
            case .success(let dataResponse):
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                    guard let jsonDictionary = jsonObject as? [String: Any] else {
                        return
                    }
                    var total = 0
                    for (key,values) in jsonDictionary
                    {
                        if(key == "error") {
                            total = (values as! [String: AnyObject]).count
                            if(total > 0) {
                                let obj = try JSONDecoder().decode(ResponseError.self, from: try! JSONSerialization.data(withJSONObject: values, options: JSONSerialization.WritingOptions.prettyPrinted))
                                completion(nil, .authenticationError(obj.message))
                                break
                            }
                        }
                        else if(key == "statementList") {
                            total = (values as! [AnyObject]).count
                            if(total > 0) {
                                let obj = try JSONDecoder().decode([Statement].self, from: try! JSONSerialization.data(withJSONObject: values, options: JSONSerialization.WritingOptions.prettyPrinted))
                                completion(obj, nil)
                                break
                            }
                        }
                    }
                }
                catch let error
                {
                    completion(nil, .badRequest(error.localizedDescription))
                }
            case .failed(let error):
                completion(nil, .badRequest(error.localizedDescription))
            }
        })
    }
    
    private func requestData(method: HttpMethod, request: String, paramRequest: NSDictionary?, completion: @escaping(Result<BankError>) -> Void) {
        guard let url = URL(string: request) else {
            completion(.failed(.urlInvalid("Serviço requisitado inválido!")))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method.rawValue
        if let json = paramRequest {
            let data = try! JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            request.httpBody = data
        }
        let urlSession = URLSession.shared
        let requestData = urlSession.dataTask(with: request) { (data, response, error) in
            if let jsonData = data {
                completion(.success(data: jsonData))
            }
            else if let error = error
            {
                completion(.failed(.badRequest(error.localizedDescription)))
            }
        }
        requestData.resume()
    }
}
