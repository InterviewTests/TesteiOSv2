//
//  Encodable+Extension.swift
//  Bank
//
//  Created by Luis Teodoro Junior on 18/05/20.
//  Copyright © 2020 Luis Teodoro Junior. All rights reserved.
//

import Foundation

public protocol BankCodable: Codable {
    func dictionary() -> [String: Any]?
}

extension BankCodable {
   
    func dictionary() -> [String: Any]? {
        if let jsonData = try? JSONEncoder().encode(self),
            let dict = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
            return dict
        }
        return nil
    }
    
    func toType<T: Codable>(_ model: T.Type) throws -> T {
        let data = try JSONEncoder().encode(self)
        return try JSONDecoder().decode(model, from: data)
    }

}
