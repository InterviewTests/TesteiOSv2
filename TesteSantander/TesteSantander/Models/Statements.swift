//
//  Statements.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

import UIKit

struct StatementList: Codable {
    let statementList: [Statement]?
    let error: Error?
}

struct Error: Codable { }

struct Statement: Codable {
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
}

extension StatementList {
    static func parse(responseData: Data?) -> StatementList? {
        var statements: StatementList?
        guard let data = responseData else { return statements }
        do {
            let decoder = JSONDecoder()
            statements = try decoder.decode(StatementList.self, from: data)
        } catch let err {
            print("Error: ", err)
        }
        
        return statements
    }
}
