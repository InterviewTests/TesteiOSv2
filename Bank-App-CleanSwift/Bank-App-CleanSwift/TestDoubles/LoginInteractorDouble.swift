//
//  LoginInteractorDouble.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 16/03/21.
//

import Foundation

class LoginInteractorDouble: LoginBusinessLogic {
    var applyBusinessLogicWasCalled: Bool = false
    var validateFieldsWasCalled: Bool = false
    
    func applyBusinessLogic(request: Login.Login.Request) {
        applyBusinessLogicWasCalled = true
        let _ = validateFields(of: User(username: request.fields.username, password: request.fields.password))
        
    }
    
    private func validateFields(of user: User) -> Bool {
        validateFieldsWasCalled = true
        return true
    }
    
}
