//
//  StatementList.swift
//  TesteiOSv2
//
//  Created by Silva, Alex Nunes da on 14/01/2019.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation


struct StatementList  : Codable {
    let title : String?
    let desc  : String?
    let date  : String?
    let value : Double?

    private enum CodingKeys : String, CodingKey {
        case title = "title"
        case desc  = "desc"
        case date  = "date"
        case value = "value"
    }

}
