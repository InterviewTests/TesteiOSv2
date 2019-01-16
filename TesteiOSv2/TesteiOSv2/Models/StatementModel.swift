//
//  StatementModel.swift
//  TesteiOSv2
//
//  Created by Silva, Alex Nunes da on 14/01/2019.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import Foundation

struct StatementModel : Codable{
    var userAccount : UserAcount?
    var statementList : [StatementList]?
    var error : ErrorModel?

    private enum CodingKeys : String, CodingKey {
          case statementList = "statementList"
          case error = "error"
    }
    
    
}
