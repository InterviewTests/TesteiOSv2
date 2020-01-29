//
//  LoginWorkers.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginWorkers {
    
    var loginStore: LoginStoreProtocol
    init(loginStore: LoginStoreProtocol) {
        self.loginStore = loginStore
    }
    
    // MARK: - Login
    func loginRequest(username: String, password: String, completionHandler: @escaping (LoginAPIModel) -> Void) {
        loginStore.loginRequest(username: username, password: password) { (loginModel: () throws -> LoginAPIModel) -> Void in
            do {
                let login = try loginModel()
                DispatchQueue.main.async {
                    completionHandler(login)
                }
            } catch {
                print("... Error Catch...")
            }
        }
    }
}

protocol LoginStoreProtocol {
    
    // MARK: - Login
    func loginRequest(username: String, password: String, completionHandler: @escaping (() throws -> LoginAPIModel) -> Void)
}
