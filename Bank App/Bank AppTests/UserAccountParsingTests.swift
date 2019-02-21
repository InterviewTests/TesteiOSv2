//
//  UserAccountParsingTests.swift
//  Bank AppTests
//
//  Created by Chrystian (Pessoal) on 19/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class UserAccountParsingTests: XCTestCase {

    func testDecodable() {
        let jsonValue: [String: Any] = [
            "userId": 1,
            "name": "Jose da Silva Teste",
            "bankAccount": "2050",
            "agency": "012314564",
            "balance": 3.3445
        ]
        
        do {
            let jsonData = try jsonValue.convertToJsonData()
            let objResponse = try JSONDecoder().decode(UserAccount.self, from: jsonData)
            
            XCTAssertEqual(objResponse.userId, 1)
            XCTAssertEqual(objResponse.name, "Jose da Silva Teste")
            XCTAssertEqual(objResponse.bankAccount, "2050")
            XCTAssertEqual(objResponse.agency, "01.231456-4")
            XCTAssertEqual(objResponse.balance, 3.3445)
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
}
