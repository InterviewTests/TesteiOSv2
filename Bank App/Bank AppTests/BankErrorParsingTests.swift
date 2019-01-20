//
//  BankErrorParsingTests.swift
//  Bank AppTests
//
//  Created by Chrystian (Pessoal) on 19/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class BankErrorParsingTests: XCTestCase {

    func testDecodableWithoutOptionals() {
        let jsonValue: [String: Any] = [
            "code": 53,
            "message": "Usuário ou senha incorreta"
        ]
        
        do {
            let jsonData = try jsonValue.convertToJsonData()
            let objResponse = try JSONDecoder().decode(BankError.self, from: jsonData)
            XCTAssertEqual(objResponse.code, 53)
            XCTAssertEqual(objResponse.message, "Usuário ou senha incorreta")
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
    
    func testDecodableOptionalsNil() {
        let jsonValue: [String: Any] = [:]
        
        do {
            let jsonData = try jsonValue.convertToJsonData()
            let objResponse = try JSONDecoder().decode(BankError.self, from: jsonData)
            XCTAssertNil(objResponse.code)
            XCTAssertNil(objResponse.message)
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }

}
