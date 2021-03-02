//
//  BankAppTests.swift
//  BankAppTests
//
//  Created by Adriano Rodrigues Vieira on 01/03/21.
//

import XCTest
import Alamofire
@testable import BankApp


class BankAppTests: XCTestCase {
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testLoginSuccessfully() {
        let parameters: [String: String] = [
            "user": LOGIN.USER,
            "password": LOGIN.PASSWORD
        ]
        
        let request = AF.request(URLS.LOGIN_ENDPOINT, method: .post, parameters: parameters)
                    
        XCTAssert(request.response?.statusCode == 200)
    }

    func testPerformanceExample() throws {
        self.measure {
        
        }
    }
}
