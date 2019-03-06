//
//  StatementResponse.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 02/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation

struct StatementResponse: Decodable {
    let statementList: [Statement]?
    let error: BankError?
    
    enum CodingKeys: String, CodingKey {
        case statementList
        case error
    }
}

extension StatementResponse {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statementList = try values.decodeIfPresent([Statement].self, forKey: .statementList)
        error = try values.decodeIfPresent(BankError.self, forKey: .error)
    }
}
