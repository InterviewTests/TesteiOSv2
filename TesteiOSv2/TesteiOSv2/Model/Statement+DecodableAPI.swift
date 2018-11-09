//
//  Statement+DecodableAPI.swift
//  TesteiOSv2
//
//  Created by Bruno on 09/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import Foundation

extension Statement {
    enum CodingKeys: String, CodingKey {
        case title
        case desc
        case date
        case value
    }
}

struct StatementContainer: Decodable {
    let statementList: [Statement]
}
