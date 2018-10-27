//
//  Statements.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import Foundation

struct Statements: Decodable {
    
    let title: String?
    let desc: String?
    let date: String?
    let value: Double?
    
    enum CodingKeys: String, CodingKey {
        case title
        case desc
        case date
        case value
    }
}
