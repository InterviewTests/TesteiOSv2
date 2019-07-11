//
//  Usuario.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 08/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import Foundation


struct UsuarioResponse: Codable {
    let usuario: Usuario
    
    enum CodingKeys: String, CodingKey {
        case usuario = "userAccount"
    }
}

struct Usuario: Codable {
    let userId: Int
    let name: String
    let conta: String
    let agencia: String
    let saldo: Double
    
    enum CodingKeys: String, CodingKey {
        case userId
        case name
        case conta = "bankAccount"
        case agencia = "agency"
        case saldo = "balance"
    }
}



