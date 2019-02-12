//
//  ErrorsEnum.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 12/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

enum LoginError:Error{
    
    case invalidPassword
    case invalidEmail
    case invalidCPF
    case incompleteForm
    case unknwowError
    
    var title: String {
        
        switch self {
        case .invalidPassword:
            return "Senha inválida!"
            
        case .invalidEmail:
            return "E-mail inválido!"
            
        case .invalidCPF:
            return "CPF inválido!"
            
        case .incompleteForm:
            return "Formulário incompleto!"
        default:
            return "Erro desconhecido!"
        }
        
    }
    
    var description: String {
        
        switch self {
        case .invalidPassword:
            return "O campo Password' deve conter pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico."
            
        case .invalidEmail:
            return "Preencha o campo 'User' com um e-mail ou um CPF."
            
        case .invalidCPF:
            return "Preencha o campo 'User' com um e-mail ou um CPF."
            
        case .incompleteForm:
            return "Preencha todos os campos do formulário."
        default:
            return "Erro desconhecido."
        }
        
    }
}
