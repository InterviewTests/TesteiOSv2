//
//  BankAPI.swift
//  Bank-app
//
//  Created by Leonardo Coutinho Santos on 15/09/19.
//  Copyright © 2019 Leocoout.dev. All rights reserved.
//

import Foundation
import Alamofire

protocol BaseRequest {
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var body: [String : Any] { get }
    var headers: HTTPHeaders { get }
}

class BankAPI {
    
    static func requestObject<T: Decodable>(object: BaseRequest,
                              success: @escaping (T) -> (),
                              failure: @escaping (Error) -> ()) {
        
        Alamofire.request(object.endpoint, method: object.method, parameters: object.body)
            .validate()
            .response { response in
                
            if let data = response.data {
                do {
                    let codable = try JSONDecoder().decode(T.self, from: data)
                    success(codable)
                } catch {
                    failure(error)
                }
            }
        }
    }

}

public struct BankResponse<Value> {
    var request: URLRequest?
    var response: DataResponse<Any>?
    var result: Result<Value>
}
