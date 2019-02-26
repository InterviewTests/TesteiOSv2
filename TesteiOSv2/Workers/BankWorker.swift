//
//  BankWorker.swift
//  TesteiOSv2
//
//  Created by Capgemini on 22/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//
import Foundation

class BankWorker {
    
    var bankProtocol : BankProtocol
    
    init(bank : BankProtocol) {
        self.bankProtocol = bank
    }
    
    
    //    func requestUser(completionHandler: @escaping (User?) -> Void) {
    //        bankProtocol.requestUser { (user, error) in
    //            if error != nil {
    //                completionHandler(user)
    //            }else{
    //                completionHandler(nil)
    //            }
    //        }
    //    }
}


protocol BankProtocol {
    func requestUser(_ request : FetchUsers.UserFormFields,
                     completionHandler: @escaping (User?, String?) -> Void)
    
    func requestStatements(_ request : ListStatements.FetchStatements.Request,
                           completionHandler: @escaping ([Statement]) -> Void)
}








// MARK: Utils
protocol BankUtilityProtocol {}

extension BankUtilityProtocol {
    
    func request(url: URL,body:Data?, method: URLMethod, completionHandler: @escaping (Bool,String) -> Void){
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        if let body = body {
            request.httpBody = body
        }
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            print("URL:\(method) \(url)\nERRO:\(error)")
            if let error = error {
                completionHandler(false,error.localizedDescription)
            }else{
                guard let data = data, let rsp = String(data: data, encoding: .utf8) else {
                    completionHandler(false,self.getErrorFromStatusCode(response))
                    return
                }
                print("RESPONSE:\(rsp)")
                completionHandler(true,rsp)
            }
            }.resume()
    }
 
    func getDictionaryFromJSON(_ json: String?) -> [String:NSObject]? {
        guard let json = json else { return nil }
        guard let data = json.data(using: .utf8) else { return nil }
        
        do{
            return try JSONSerialization
                    .jsonObject(with: data,
                                options: .mutableContainers) as? [String:NSObject]
        }catch{
            print(error)
        }
        
        return nil
    }
    
    private func getErrorFromStatusCode(_ response: URLResponse?) -> String {
        var error = "Erro na requisição."
        if let rspCode = (response as? HTTPURLResponse)?.statusCode {
            error += " \(rspCode)"
        }
        return error
    }
}

enum URLMethod : String {
    case GET,
    POST,
    PUT,
    DELETE
}
