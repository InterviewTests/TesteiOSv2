//
//  ValitationInputsWorkerTest.swift
//  TesteSantaderTests
//
//  Created by Bruno Chen on 11/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import TesteSantader
import Foundation

class ValitationInputsWorkerTest: XCTestCase {

    var valitationInputWorker: valitationInputsWorkerProtocol?
    
    override func setUp() {
        valitationInputWorker = ValitationInputsWorker()
    }
    
    func test()  {
        let currectPasswordStr = "12345678@A"
        
        XCTAssertFalse(valitationInputWorker!.isValidImputs(userStr: "123456789123", passwordStr: currectPasswordStr), "try 12 number for CPF, false")
        XCTAssertFalse(valitationInputWorker!.isValidImputs(userStr: "1234567891", passwordStr: currectPasswordStr), "try 10 number for CPF, false")
        XCTAssertTrue(valitationInputWorker!.isValidImputs(userStr: "12345678912", passwordStr: currectPasswordStr), "try user 11 number for CPF")
    
        
        XCTAssertFalse(valitationInputWorker!.isValidImputs(userStr: "@dsa.com", passwordStr: currectPasswordStr), "try false email. false")
        XCTAssertTrue(valitationInputWorker!.isValidImputs(userStr: "123@das.com", passwordStr: currectPasswordStr), "try email, true")
        
    }

}
