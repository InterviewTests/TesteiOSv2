//
//  Consig.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 17/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import Foundation
class Config{
    static let endPointURL = "https://bank-app-test.herokuapp.com"
    
    static func pathStatements(id: String)->String{
            return "/api/statements/" + id
    }
}
