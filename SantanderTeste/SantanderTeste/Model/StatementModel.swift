//
//  StatementModel.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation

struct StatementsModel: Codable {
    let statementList: [StatementList]?
    let error: Error?
}
class StatementList: Codable {
    let title:String?
    let desc:String?
    let date: String?
    let value: Double?
}
