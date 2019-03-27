//
//  LoginInteractor.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation

class LoginInteractor {
    
    func login(_ user: String, _ password: String, completionHandler: @escaping ((UserAccount?, Error?) -> Void )) {
        let service = LoginService()
        
        let parameters = "user=\(user)&password=\(password)".data(using: .utf8)
        
        RKLoading.showLoading()
        service.login(parameters: parameters) { (data, response, error) in
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
            
            do {
                let login = try JSONDecoder().decode(Login.self, from: data!)
                completionHandler(login.userAccount, error)
            } catch {
                completionHandler(nil, error)
            }
        }
    }
    
}
