//
//  UserLogin.swift
//  Bank AppTests
//
//  Created by Chrystian on 17/01/19.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class UserLoginParsingTests: XCTestCase {

    func testEncodable() {
        do {
            let stringJson: [String: Any] = [
                "user": "Chrystian",
                "password": "112233"
            ]
            
            let userLogin = UserLogin(user: "Chrystian", password: "112233")
            let jsonData = try JSONEncoder().encode(userLogin)
            let jsonDataAssset = try stringJson.convertToJsonData()
            
            XCTAssertEqual(jsonDataAssset, jsonData)
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
}
