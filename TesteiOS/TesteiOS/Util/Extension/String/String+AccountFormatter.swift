//
//  String+AccountFormatter.swift
//  TesteiOS
//
//  Created by Fernando Gomes on 14/06/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import Foundation

extension String {
    mutating func bankAccountFormatter() -> String {
        guard self.count < 3 else {
            var characters = Array(self)
            characters.insert(".", at: 2)
            characters.insert("-", at: self.count - 1)
            self = String(characters)
            return self
        }
        return self
    }
}
