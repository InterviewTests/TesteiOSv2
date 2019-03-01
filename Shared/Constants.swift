//
//  Constants.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 26/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import Foundation

struct Constants{
    
    enum httpMethod: String{
        case POST = "POST"
        case GET = "GET"
    }
    
    struct Login{
        static let passwordDoesntMatchRequirements = "A senha deve conter, pelo menos, uma letra maiúscula, um caracter especial e um caracter alfanumérico."
        static let usernameDoesntMatchRequirements = "O usuário deve ser seu endereço de email ou CPF válidos."
        static let credentialsNotValid = "Usuário e/ou senha não estão corretos. Verifique."
    }
    
    struct Statement{
        static let couldNotRetrieveStatement = "Não foi possível obter seu extrato. Por favor, tente mais tarde ou entre em contato com nosso SAC."
    }
    
    struct Request{
        private static let HTTPHeader = "https://"
        private static let host = "bank-app-test"
        private static let domain = "herokuapp.com"
        
        private static let statementsEndpoint = "api/statements/1"
        private static let loginEndpoint = "api/login"
        
        static let login = HTTPHeader + host + "." + domain + "/" + loginEndpoint
        static let statements = HTTPHeader + host + "." + domain + "/" + statementsEndpoint
    }
    
    struct UserDefaults{
        static let usernameKey = "username"
    }
}
