//
//  Service.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 03/03/21.
//

import Foundation
import Alamofire

struct Service {
    func authenticate(user: String, password: String) -> Int? {
        return AF.request(URLS.LOGIN_ENDPOINT,
                   method: .post,
                   parameters: LOGIN_EXAMPLE.USER_PARAMETERS,
                   encoder: URLEncodedFormParameterEncoder(destination: .httpBody)).response?.statusCode
    }    
}
