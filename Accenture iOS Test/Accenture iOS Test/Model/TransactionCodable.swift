//
//  TransactionDecoder.swift
//  Accenture iOS Test
//
//  Created by João Pedro Giarrante on 26/07/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import Foundation

struct TransactionCodable : Codable {
var status : Bool?
var total : Int?
var users : [BankTransaction]? //list of users
var msg : String?

enum CodingKeys: String, CodingKey {

    case status = "status"
    case total = "total"
    case users = "users"
    case msg = "msg"
}

init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    status = try values.decodeIfPresent(Bool.self, forKey: . status)
    total = try values.decodeIfPresent(Int.self, forKey: . total)
    users = try values.decodeIfPresent([BankTransaction].self, forKey: . users)
    msg = try values.decodeIfPresent(String.self, forKey: . msg)
}
}
