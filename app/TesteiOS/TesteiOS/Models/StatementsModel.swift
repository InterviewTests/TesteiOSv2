//
//  StatementsModel.swift
//  TesteiOS
//
//  Created by Emerson Pereira on 15/01/2019.
//  Copyright © 2019 doug. All rights reserved.
//

import Foundation

struct StatementsModel: Codable {
    let statementList: [StatementObject]
}

struct StatementObject: Codable {
    let title: String!
    let desc: String!
    let date: String!
    let value: Double!
}
