//
//  Seeds.swift
//  TestSantanderTests
//
//  Created by ely.assumpcao.ndiaye on 10/07/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

@testable import TestSantander
import XCTest

struct Seeds
{
    struct Users
    {
        let userId: Int
        let name, bankAccount, agency: String
        let balance: Double
        static let amy = Users(userId: 1, name: "Jose da Silva Teste", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        
    }
}
