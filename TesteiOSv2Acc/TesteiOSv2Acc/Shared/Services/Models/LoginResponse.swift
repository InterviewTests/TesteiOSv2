//
//  LoginResponse.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 24/05/19.
//  Copyright © 2019 Marlon Santos Heitor. All rights reserved.
//
import Foundation

struct LoginResponse: BaseServiceModel {
    
    let userAccount: UserAccount?
    let error: ServiceError?

    static func parse(jsonData: Data) -> BaseServiceModel {
        //let data = jsonString.data(using: .utf8)
        let decoder = JSONDecoder()
        let object: LoginResponse = try! decoder.decode(LoginResponse.self, from: jsonData)
        return object
    }
    
}
