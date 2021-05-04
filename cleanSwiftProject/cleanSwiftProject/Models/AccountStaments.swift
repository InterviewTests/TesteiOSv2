//
//  AccountStaments.swift
//  cleanSwiftProject
//
//  Created by santosw ios samel on 01/05/21.
//

import Foundation

struct AccountStamentsList: Decodable {
    let statementList: [StatementData]
    let error: ErrorData
    
    enum CodingKeys: String, CodingKey {
        case statementList
        case error
    }
        
    struct StatementData: Decodable {
        let title: String?
        let description: String?
        let date: String?
        let totalAmount: Double?
        
        enum CodingKeys: String, CodingKey {
            case title
            case description = "desc"
            case date
            case totalAmount = "value"
        }
    }
    
    struct ErrorData: Decodable {
        let code: Int?
        let message: String?
        
        enum CodingKeys: String, CodingKey {
            case code
            case message
        }
    }
}

struct Statement {
    let title: String
    let description: String
    let date: String
    let totalAmount: String
}
