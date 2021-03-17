//
//  Constants.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 17/03/21.
//

import Foundation


/// Constants representing strings or objects for general purposes

struct Constants {
    // MARK: -
    /// Response in case the user inserts `username` or `password` invalid based on login business logic 
    static let USER_OR_PASSWORD_INVALID_RESPONSE: Login.Login.Response = {
        let userAccount: UserAccount? = nil
        let message =
            """
            Pode ser que sua senha não esteja em um formato válido (6 digitos no mínimo, sendo ao menos uma letra maiuscula, um número e um caractere especial).
            
            Que tal verificar, também, se seu nome de usuário é um email ou CPF válido?
            """
        let errorMessage: ErrorMessage? = ErrorMessage(code: 23, message: message)
        
        return Login.Login.Response(user: userAccount, error: errorMessage)
    }()
}
