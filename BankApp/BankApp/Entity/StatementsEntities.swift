//
//  StatementsEntities.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import Foundation

struct StatementResponseStruct: Decodable {
    let statementList: [StatementStruct]
    //let error: {}
}

struct StatementStruct: Decodable {
    let title: String
    let desc: String
    let date: String //"2018-08-15"
    let value: Float
}
