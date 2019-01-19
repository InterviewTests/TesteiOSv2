//
//  StatementParsingTests.swift
//  Bank AppTests
//
//  Created by Chrystian (Pessoal) on 19/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class StatementParsingTests: XCTestCase {

    func testDecodable() {
        let jsonValue: [String: Any] = [
            "title": "Pagamento",
            "desc": "Conta de luz",
            "date": "2018-08-15",
            "value": -50
        ]
        
        do {
            let jsonData = try jsonValue.convertToJsonData()
            let objResponse = try JSONDecoder().decode(Statement.self, from: jsonData)
            XCTAssertEqual(objResponse.title, "Pagamento")
            XCTAssertEqual(objResponse.description, "Conta de luz")
            XCTAssertEqual(objResponse.date, "2018-08-15".toDate())
            XCTAssertEqual(objResponse.value, "-R$50,00")
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
}
