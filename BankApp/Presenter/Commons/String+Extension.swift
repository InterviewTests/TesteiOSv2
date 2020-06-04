//
//  StringCheck.swift
//  PresenterTests
//
//  Created by Estaife Lima on 03/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Foundation

struct StringCheck {
    
    private init() { }
    
    static func isValidField(_ content: String?) -> Bool {
        guard let string = content else { return false }
        return !string.isEmpty
    }
}
