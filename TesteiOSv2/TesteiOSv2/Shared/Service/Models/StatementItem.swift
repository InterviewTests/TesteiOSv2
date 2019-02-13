//
//  Statement.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 11/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

struct StatementItem : Codable {
    
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
    
    private enum CodingKeys : String, CodingKey {
        case title = "title"
        case desc = "desc"
        case date = "date"
        case value = "value"
    }
    
}
