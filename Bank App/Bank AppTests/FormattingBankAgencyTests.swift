//
//  FormattingBankAgencyTests.swift
//  Bank AppTests
//
//  Created by Chrystian (Pessoal) on 19/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import XCTest
@testable import Bank_App

class FormattingBankAgencyTests: XCTestCase {
    
    func testFormatAgency() {
        let agencyString = "400430454"
        XCTAssertEqual(agencyString.toBankAgency(), "40.043045-4")
    }
    
    func testFormatAgencyAlredyFormatting() {
        let agencyString = "40.043045-4"
        XCTAssertEqual(agencyString.toBankAgency(), "40.043045-4")
    }
}
