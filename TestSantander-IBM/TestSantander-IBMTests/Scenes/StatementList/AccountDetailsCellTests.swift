//
//  AccountDetailsCellTests.swift
//  TestSantander-IBMTests
//
//  Created by Erika Albizzati on 27/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class AccountDetailsCellTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
    }
    
    func test_setCell(){
        let bundle = Bundle(for: AccountDetailsCell.self)
        guard let cell = bundle.loadNibNamed("AccountDetailsCell", owner: nil)?.first as? AccountDetailsCell else {
            return XCTFail()
        }

        let userAccount = UserAccount(userId: 2, name: "Erika Albizzati", bankAccount: "010278893-9", agency: "0207", balance: -3.56, userName: "ealbizzati@gmail.com")
        
        cell.set(account: userAccount)
        
        XCTAssert(cell.nameLabel.text == "Erika Albizzati")
        XCTAssert(cell.accountDataLabel.text == "0207/010278893-9")
        XCTAssert(cell.balanceLabel.text == "R$ -3.56")
    }
}
