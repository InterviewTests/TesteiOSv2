//
//  BankSpec.swift
//  BankAppTests
//
//  Created by Adriano Rodrigues Vieira on 02/03/21.
//

import XCTest
import Quick
import Nimble
import Alamofire

class BankSpec: QuickSpec {
    override func spec() {
        let parameters: [String: String] = [
            "user": "test_user",
            "password": "Test@1"
        ]
        let request = AF.request("https://bank-app-test.herokuapp.com/api/login",
                                 method: .post,
                                 parameters: parameters,
                                 encoder: URLEncodedFormParameterEncoder(destination: .httpBody))
        
        
        describe("LOGIN TEST:") {
            it("logs successfully") {
                var statusCode = 0
                
                request.responseJSON { response in
                    statusCode = request.response!.statusCode
                    expect(statusCode).to(beGreaterThanOrEqualTo(200))
                }                
            }
        }
    }
}

