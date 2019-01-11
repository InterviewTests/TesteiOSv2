//
//  UsersAPI.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UsersAPI: UsersStoreProtocol {
    let API = "https://bank-app-test.herokuapp.com/api/"
    
    func loginUser(user: String, password: String, completionHandler: @escaping (User?) -> Void) {
        let parameters: Parameters = [
            "user": user,
            "password": password
        ]
        Alamofire.request("\(self.API)login", method: .post, parameters: parameters)
            .responseJSON { response in
                do {
                    if let error = response.error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }
                    
                    if let data = response.data {
                        let json = try JSON(data: data)
                        let user = json["userAccount"]
                        
                        completionHandler(User(userId: user["userId"].int!, name: user["name"].string!, bankAccount: user["bankAccount"].string!, agency: user["agency"].string!, balance: user["balance"].float!))
                    }
                } catch {
                    return
                }
        }
    }
}
