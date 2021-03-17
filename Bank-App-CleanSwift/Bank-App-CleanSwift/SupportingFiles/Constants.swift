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
            Por favor, verifique se:
            * sua senha possui ao menos 6 dígitos, sendo:
               - um número;
               - uma letra maiúscula;
               - um caractere especial (!, $, %, &, @, ?, ., _, -).
            * seu nome de usuário é:
               - um email com formato válido; ou
               - um CPF válido (com ou sem pontos e traço).
            """
        let errorMessage: ErrorMessage? = ErrorMessage(code: 23, message: message)
        
        return Login.Login.Response(user: userAccount, error: errorMessage)
    }()
}
