//
//  StatementList.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 12/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

struct StatementModel : Codable{
    
    var statementList : [Statement]?
    var error : ErrorModel?
    
    private enum CodingKeys : String, CodingKey {
        case statementList = "statementList"
        case error = "error"
    }
}
