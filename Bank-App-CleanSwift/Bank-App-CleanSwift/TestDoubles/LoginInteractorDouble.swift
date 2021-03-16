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
        let _ = validateFields(of: LoginDoubles.USER_WITH_GOOD_EMAIL_AND_GOOD_PASSWORD)
        
    }
    
    private func validateFields(of user: User) -> Bool {
        validateFieldsWasCalled = true
        return true
    }
    
}
