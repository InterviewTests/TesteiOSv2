//
//  LoginInteractor.swift
//  Teste Santander
//
//  Created by THIAGO on 02/07/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import Foundation
import CPF_CNPJ_Validator

enum ErrorField {
    case empty
    case valid
    case cpfEmail
}
enum FieldType: Hashable {
    case user
    case password
    
}

class LoginInteractor: LoginInteractorInput {
    
    weak var output: LoginInteractorOutput?
    
    var manager: LoginManager
    
    init(manager: LoginManager) {
        self.manager = manager
    }
    
    func fetch(user: String?, password: String?) {
       validField(user: user, password: password)
    }
    
    func validPassword(value: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: value)
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    func removeSpecialCharsFromString(text: String) -> String {
        return text
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: "-", with: "")
        .trimmingCharacters(in: .whitespaces)
        
        
    }
    
    func validField(user: String?, password: String?) {
        output?.cleanFields()
        
        guard let user = user, let password = password else {
            output?.errorField(type: .user, valid: .empty)
            output?.errorField(type: .password, valid: .empty)
            return
        }
        
        if user.isEmpty && password.isEmpty {
            output?.errorField(type: .user, valid: .empty)
            output?.errorField(type: .password, valid: .empty)
        
        } else if user.isEmpty {
            output?.errorField(type: .user, valid: .empty)
            
        } else if password.isEmpty {
            output?.errorField(type: .password, valid: .empty)
        
        } else if validateEmail(enteredEmail: user) || !BooleanValidator().validate(cpf: removeSpecialCharsFromString(text: user)) {
             output?.errorField(type: .user, valid: .cpfEmail)
            
        } else if !validPassword(value: password) {
            output?.errorField(type: .password, valid: .valid)
        
        } else {
            manager.fetch(user: user, password: password)
        }
    }
    
}
extension LoginInteractor: LoginManagerOutput {
    
    func fetched(with user: LoginEntity) {
        output?.didlogged()
    }
    
    func error(error: Error) {
        output?.didError(message: error.localizedDescription)
    }
}
