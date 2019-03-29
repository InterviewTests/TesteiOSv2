//
//  LoginInteractor.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class LoginInteractor {
    
    let keychainKey = "userAccountKey"
    var presenter: LoginPresentationLogic?
    
    func validateUsername(_ username: String?) -> Bool {
        guard let username = username else { return false }
        
        let isEmail = ValidatorHelper.isEmail(username)
        let isDocument = ValidatorHelper.isCpf(username)
        guard isEmail || isDocument else {
            return false
        }
        
        return true
    }
    
    func validatePassword(_ password: String?) -> Bool {
        guard let password = password else { return false }
        return ValidatorHelper.password(password)
    }
    
    func login(_ user: String, _ password: String) {
        let service = LoginService()
        
        let parameters = "user=\(user)&password=\(password)".data(using: .utf8)
        
        RKLoading.showLoading()
        service.login(parameters: parameters) { [unowned self] (data, response, error) in
            RKLoading.hideLoading()
            
            var error: Error?
            guard error == nil else {
                error = NSError(domain: "DesafioSantander", code: -1050, userInfo: [NSLocalizedDescriptionKey : "Ocorreu um erro ao tentar efetuar o login."])
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, !acceptableStatusCodes.contains(httpResponse.statusCode) {
                error = NSError(domain: "DesafioSantander", code: -1050, userInfo: [NSLocalizedDescriptionKey : "Ocorreu um erro ao tentar efetuar o login."])
                return
            }
            
            let login = try? JSONDecoder().decode(Login.self, from: data!)
            
            let userData = try? JSONEncoder().encode(login?.userAccount)
            KeychainWrapper.standard.set(userData!, forKey: self.keychainKey)
            self.presenter?.presentUserLogged(login?.userAccount, error)
        }
    }
    
    func checkPreviousUser() {
        guard let data = KeychainWrapper.standard.data(forKey: keychainKey) else {
            return
        }
        
        let userAccount = try? JSONDecoder().decode(UserAccount.self, from: data)
        self.presenter?.presentPreviousUser(userAccount)
    }
    
}
