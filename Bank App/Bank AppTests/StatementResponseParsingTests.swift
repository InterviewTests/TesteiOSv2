//
//  StatementResponseParsingTests.swift
//  Bank AppTests
//
//  Created by Chrystian (Pessoal) on 19/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class StatementResponseParsingTests: XCTestCase {

    func testDecodableWithStatementList() {
        let jsonValue: [String: Any] = [
            "statementList": [
                [
                    "title": "Pagamento",
                    "desc": "Conta de luz",
                    "date": "2018-08-15",
                    "value": -50
                ],
                [
                    "title": "TED Recebida",
                    "desc": "Joao Alfredo",
                    "date": "2018-07-25",
                    "value": 745.03
                ],
                [
                    "title": "DOC Recebida",
                    "desc": "Victor Silva",
                    "date": "2018-06-23",
                    "value": 399.9
                ]
            ],
            "error": [:]
        ]
        
        do {
            let jsonData = try jsonValue.convertToJsonData()
            let objResponse = try JSONDecoder().decode(StatementResponse.self, from: jsonData)
            XCTAssertNotNil(objResponse.statementList)
            XCTAssertNotNil(objResponse.error)
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
    
    func testDecodableWithError() {
        let jsonValue: [String: Any] = [
            "statementList": [],
            "error": [
                "code": 53,
                "message": "Usuário não encontrado"
            ]
        ]
        
        do {
            let jsonData = try jsonValue.convertToJsonData()
            let objResponse = try JSONDecoder().decode(StatementResponse.self, from: jsonData)
            XCTAssertNotNil(objResponse.statementList)
            XCTAssertNotNil(objResponse.error)
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
    
    func testDecodableOptionalsNil() {
        let jsonValue: [String: Any] = [:]
        
        do {
            let jsonData = try jsonValue.convertToJsonData()
            let objResponse = try JSONDecoder().decode(StatementResponse.self, from: jsonData)
            XCTAssertNil(objResponse.statementList)
            XCTAssertNil(objResponse.error)
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
}
