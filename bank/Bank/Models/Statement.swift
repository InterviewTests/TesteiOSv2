//
//  Statement.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

struct Statement: Codable, Equatable  {
    let title: String
    let desc: String
    let date: String
    let value: Double
    
    init(title: String, desc: String, date: String, value: Double) {
        self.title = title
        self.desc = desc
        self.date = date
        self.value = value
    }
    
    static func == (lhs: Statement, rhs: Statement) -> Bool {
        return lhs.title == rhs.title &&
            lhs.desc == rhs.desc &&
            lhs.date == rhs.date &&
            lhs.value == rhs.value
    }
}
