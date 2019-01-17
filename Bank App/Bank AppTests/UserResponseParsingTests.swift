//
//  Bank_AppTests.swift
//  Bank AppTests
//
//  Created by Chrystian (Pessoal) on 09/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class UserResponseParsingTests: XCTestCase {

    func testDecodableWithUserAccountData() {
        let jsonString: [String: Any] = [
            "userAccount": [
                "userId": 1,
                "name": "Jose da Silva Teste",
                "bankAccount": "2050",
                "agency": "012314564",
                "balance": 3.3445
            ],
            "error": [:]
        ]
        
        do {
            let jsonData = try jsonString.convertToJsonData()
            let objResponse = try JSONDecoder().decode(UserResponse.self, from: jsonData)
            XCTAssertNotNil(objResponse.userAccount)
            XCTAssertNotNil(objResponse.error)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testDecodableWithNil() {
        let jsonString: [String: Any] = [:]
        
        do {
            let jsonData = try jsonString.convertToJsonData()
            let objResponse = try JSONDecoder().decode(UserResponse.self, from: jsonData)
            XCTAssertNil(objResponse.userAccount)
            XCTAssertNil(objResponse.error)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
