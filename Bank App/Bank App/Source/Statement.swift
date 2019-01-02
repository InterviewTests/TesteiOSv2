//
//  Statement.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 02/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation

struct Statement: Decodable {
    
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
