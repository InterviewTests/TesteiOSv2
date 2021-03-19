//
//  Statements.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import Foundation

// MARK: - Data from GET request
struct StatementListData: Decodable {
    let statementList: [StatementData]
    
    enum CodingKeys: String, CodingKey {
        case statementList
    }
    
    
    struct StatementData: Decodable {
        let title: String
        let description: String
        let date: String
        let totalAmount: Double
        
        enum CodingKeys: String, CodingKey {
            case title
            case description = "desc"
            case date
            case totalAmount = "value"
        }
    }
}

// MARK: - POSO (plain old swift objects)
struct Statement {
    let title: String
    let description: String
    let date: String
    let totalAmount: String    
}
