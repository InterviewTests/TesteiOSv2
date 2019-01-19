//
//  Statement.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 02/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation

struct Statement {
    
    let title: String
    let description: String
    let date: Date
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "desc"
        case date
        case value
    }
}

extension Statement: Decodable {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        description = try values.decode(String.self, forKey: .description)
        date = try values.decode(String.self, forKey: .date).toDate()!
        value = try values.decode(Double.self, forKey: .value).toStringCurrency()
    }
}

extension String {
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: self)
        return date

    }
}
