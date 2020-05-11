//
//  UserBankAPI.swift
//  TesteSantader
//
//  Created by Bruno Chen on 08/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation
import Alamofire

class UserBankAPIService: UserStoreProtocol {

    
    // MARK: - CRUD operation - Optional error
    
    func fetchUser(userID: String, password: String, completionHandler: @escaping (UserData?, UserStoreError?) -> Void) {
        let baseUrl = "https://bank-app-test.herokuapp.com"
        let urlString = baseUrl + "/api/login"

        AF.request(urlString, method: .post, parameters: ["user": userID, "password": password]).responseJSON { (response) in
            guard let data = response.data else {
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
                return
            }
            do {
                let userData = try JSONDecoder().decode(UserData.self, from: data)
                completionHandler(userData, nil)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch {
                print("error: ", error)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            }
        }
        
    }

    func fetchStatementList(userID: String, completionHandler: @escaping (StatementListData?, UserStoreError?) -> Void) {
        let urlString = "https://bank-app-test.herokuapp.com/api/statements/1"

        AF.request(urlString).responseJSON { (response) in
            guard let data = response.data else {
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
                return
            }
            do {
                let statementListData = try JSONDecoder().decode(StatementListData.self, from: data)
                completionHandler(statementListData, nil)
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
            } catch {
                completionHandler(nil , .CannotFetch("Cannot fetch data"))
                print("error: ", error)
            }
        }
        
    }
    
}
