//
//  UserAccountTests.swift
//  TestSantander-IBMTests
//
//  Created by Renato Carvalhan on 27/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import XCTest

class UserAccountTests: XCTestCase {

    func testInitUserAccount(){
        let user = UserAccount(userId: 1, name: "Renato Carvalhan", bankAccount: "2050", agency: "012314564", balance: 3.3445)
        XCTAssertEqual(user.userId, 1)
        XCTAssertEqual(user.name, "Renato Carvalhan")
        XCTAssertEqual(user.bankAccount, "2050")
        XCTAssertEqual(user.agency, "012314564")
        XCTAssertEqual(user.balance, 3.3445)
    }

}
