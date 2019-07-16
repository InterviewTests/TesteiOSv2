//
//  Usuario.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/14/19.
//  Copyright © 2019 b. All rights reserved.
//

import Foundation

struct UsuarioResponse: Codable {
    let usuario: Cliente
    
    enum CodingKeys: String, CodingKey {
        case usuario = "userAccount"
    }
}

struct Cliente: Codable {
    let userId: Int
    let name: String
    let conta: String
    let agencia: String
    let saldo: Double
    //enum trazer os dados do json e faz um merge com minhas variaveis da struct
    enum CodingKeys: String, CodingKey {
        case userId
        case name
        case conta = "bankAccount"
        case agencia = "agency"
        case saldo = "balance"
    }
}
