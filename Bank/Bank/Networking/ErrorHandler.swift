//
//  GenericError.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import Foundation

struct ErrorHandler: BankCodable, Error {
    var code: Int?
    var message: String?
}

enum BankError: Error {
    case invalidPassword
    case isValidUser
}

extension BankError {
    public var localizedDescription: String {
        switch self {
        case .invalidPassword:
            return "O campo tem que conter pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico."
        case .isValidUser:
            return "O campo tem que conter CPF ou E-mail válido."
        }
    }
}
