//
//  ApiResponse.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import Foundation

struct ApiResponse: Decodable {
    
    let userAccount: UserAccount?
    let statementList: [Statements]?
    let error: ErrorModel?
    
    enum CodingKeys: String, CodingKey {
        case userAccount
        case statementList
        case error
    }
}
