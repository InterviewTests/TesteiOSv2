//
//  Dictionary+Extention.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 14/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
