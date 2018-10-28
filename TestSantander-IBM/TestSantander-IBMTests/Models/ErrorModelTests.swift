//
//  ErrorModelTests.swift
//  TestSantander-IBMTests
//
//  Created by Erika Albizzati on 27/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class ErrorModelTests: XCTestCase {
    func testeInit_ErrorModel(){
        let error = ErrorModel(code: 404, message: "Not Found")
        
        XCTAssertEqual(error.code, 404)
        XCTAssertEqual(error.message, "Not Found")
    }
}
