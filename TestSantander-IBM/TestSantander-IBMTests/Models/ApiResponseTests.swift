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
        
        XCTAssertEqual(user.userId, 10)
        XCTAssertEqual(statements.title, "Teste")
        XCTAssertEqual(statements.desc, "teste")
        XCTAssertEqual(statements.date, "2018-20-10")
        XCTAssertEqual(statements.value, 1000.45)
    }

}
