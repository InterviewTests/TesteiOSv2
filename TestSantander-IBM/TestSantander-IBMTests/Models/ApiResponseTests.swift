//
//  ApiResponseTests.swift
//  TestSantander-IBMTests
//
//  Created by Erika Albizzati on 27/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class ApiResponseTests: XCTestCase {
    func testeInit_userAccount(){
        let user = UserAccount(userId: 10)
        let statements = Statements(title: "Teste", desc: "teste", date: "2018-20-10", value: 1000.45)
        
        let apiResponse = ApiResponse(userAccount: user, statementList: [statements], error: nil)

        XCTAssertEqual(apiResponse.userAccount?.userId, 10)
        XCTAssertEqual(apiResponse.statementList?[0].title, "Teste")
        XCTAssertEqual(apiResponse.statementList?[0].desc, "teste")
        XCTAssertEqual(apiResponse.statementList?[0].date, "2018-20-10")
        XCTAssertEqual(apiResponse.statementList?[0].value, 1000.45)
    }
}
