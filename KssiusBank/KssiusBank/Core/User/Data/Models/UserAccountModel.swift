//
//  UserAccount.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 15/06/23.
//

import Foundation

struct UserAccountModel : Codable, Equatable {
    let userId: String
    let email: String
    let cpf: String
    let name: String
    let accountNumber: String
    let agency: String
    let balance: String

    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case email
        case cpf
        case name
        case accountNumber
        case agency
        case balance
    }
}
