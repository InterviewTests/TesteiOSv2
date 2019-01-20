//
//  BankAPI.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 29/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation

class BankAPI: BankAPIProtocol {
    
    /**
     * Documentation for this class:
     * https://hackernoon.com/everything-about-codable-in-swift-4-97d0e18a2999
     * https://www.raywenderlich.com/567-urlsession-tutorial-getting-started
     * https://medium.com/@sdrzn/networking-and-persistence-with-json-in-swift-4-c400ecab402d
     */
    
    var urlHost = "bank-app-test.herokuapp.com"
    var urlScheme = "https"
    var urlPath = ""
    
    var parameters: [[String: String]]? = []
    
    func loginUser(login: UserLogin, completionHandler: @escaping (UserResponse?) -> Void) {
        
        let encoder = JSONEncoder()
        let jsonData = try? encoder.encode(login)
        
        // try request
        urlPath = "/api/login"
        urlRequest(type: .post, params: jsonData) { (responseData) in
            if let jsonData = responseData {
                do {
                    let response = try JSONDecoder().decode(UserResponse.self, from: jsonData)
                    if let bankError = response.error, bankError.code != nil {
                        completionHandler(response)
                        print(bankError)
                    }
                    else if let _ = response.userAccount {
                        completionHandler(response)
                    }
                } catch {
                    self.catchNetworkError(responseData)
                    completionHandler(nil)
                }
            }
            else {
                self.catchNetworkError(responseData)
                completionHandler(nil)
            }
        }
    }
    
    func statementList(by userId: Int, completionHandler: @escaping (StatementResponse?) -> Void) {
        
        // try request
        urlPath = "/api/statements/\(userId)"
        urlRequest(type: .get, params: nil) { (responseData) in
            if let jsonData = responseData {
                do {
                    let response = try JSONDecoder().decode(StatementResponse.self, from: jsonData)
                    if let bankError = response.error, bankError.code != nil {
                        completionHandler(response)
                        print(bankError)
                    }
                    else if let _ = response.statementList {
                        completionHandler(response)
                    }
                } catch {
                    self.catchNetworkError(responseData)
                    completionHandler(nil)
                }
            }
            else {
                self.catchNetworkError(responseData)
                completionHandler(nil)
            }
        }
    }
}
