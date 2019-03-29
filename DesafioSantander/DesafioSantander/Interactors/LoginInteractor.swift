//
//  LoginInteractor.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 27/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import Foundation

class LoginInteractor {
    
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
//            KeychainHelper.saveAccount(account: (login?.userAccount)!)
            self.presenter?.presentUserLogged(login?.userAccount, error)
//            let teste = KeychainHelper.account(agency: "012314564", bankAccount: "2050")
//            print("teste", teste)
        }
    }
    
}
