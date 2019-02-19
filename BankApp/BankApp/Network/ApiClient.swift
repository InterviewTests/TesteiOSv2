//
//  ApiClient.swift
//  BankApp
//
//  Created by Tripmatix on 18/02/19.
//  Copyright © 2019 Tripmatix. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiClient {
    
    func request<T: Decodable>(
        type: T.Type,
        endpoint: String,
        method: HTTPMethod,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        onSuccess: @escaping (T) -> Void,
        onError: @escaping (Error) -> Void)
}

class ApiManager: ApiClient {
    
    func request<T: Decodable>(type: T.Type,
                               endpoint: String,
                               method: HTTPMethod,
                               parameters: Parameters?,
                               encoding: ParameterEncoding,
                               onSuccess: @escaping (T) -> Void,
                               onError: @escaping (Error) -> Void) {
        let baseUrl = "https://bank-app-test.herokuapp.com/api/"
        
        let request = AF.request(baseUrl + endpoint, method: method, parameters: parameters, encoding: encoding)
        request.validate(statusCode: 200..<300)
        request.responseJSON { response in
            #if DEBUG
            print(request)
            print(response)
            #endif
            
            switch(response.result) {
                
            case .success:
                do {
                    let parsedJson = try JSONDecoder().decode(T.self, from: response.data!)
                    onSuccess(parsedJson)
                } catch let error {
                    onError(error)
                }
                
            case.failure(let error):
                onError(error)
            }
        }
    }
}
