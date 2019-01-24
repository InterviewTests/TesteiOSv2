//
//  TesteIOSTests.swift
//  TesteIOSTests
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright © 2019 ti alto nivel. All rights reserved.
//

import XCTest
@testable import TesteIOS

class TesteIOSTests: XCTestCase {
    
    func testValidCPF(){
        let cpf  = "user@domain.ltv"
        XCTAcertTrue(Validator.isValidCPF(cpf: cpf))
    }
}
