//
//  BankError.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 30/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import UIKit

struct BankError: Decodable {
    let message: String?
    let code: Int?
    
    init(message: String, errorCode: Int) {
        self.message = message
        self.code = errorCode
    }
}

enum BankErrorType {
    case userNotFound
    case userWrong
}

extension BankErrorType {
    var error: BankError {
        switch self {
        case .userNotFound:
            return .init(message: NSLocalizedString("ERRO_USUARIO_NAO_ENCONTRADO", comment: ""), errorCode: 417)
        case .userWrong:
            return .init(message: NSLocalizedString("ERRO_USUARIO_DADOS_ERRADOS", comment: ""), errorCode: 417)
        }
    }
}
