//
//  StatementsData.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 05/03/21.
//

import Foundation

struct StatementsData: Codable {
    let statementList: [StatementData]
    
    enum CodingKeys: String, CodingKey {
        case statementList
    }
    
    struct StatementData: Codable {
        let title: String
        let description: String
        let date: String
        let value: Double
        
        enum CodingKeys: String, CodingKey {
            case title
            case description = "desc"
            case date
            case value
        }
    }

}


