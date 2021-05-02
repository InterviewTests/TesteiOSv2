//
//  User.swift
//  Bank App
//
//  Created by Christian Castro on 30/04/21.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var accountID: String
    var balance: String
}

struct CurrencyByUser: Codable {
    var idCurrency: Int
    var type: String
    var date: String
    var description: String
    var value: String
}
