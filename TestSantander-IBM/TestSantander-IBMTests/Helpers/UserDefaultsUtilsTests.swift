//
//  UserDefaultsUtilsTests.swift
//  TestSantander-IBMTests
//
//  Created by Erika Albizzati on 28/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class UserDefaultsUtilsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_retrieveData(){
        let userAccount = UserAccount(userId: 2, name: "Erika Albizzati", bankAccount: "010278893-9", agency: "0207", balance: -3.56, userName: "ealbizzati@gmail.com")
        
        UserDefaults.standard.set(userAccount.userId, forKey: "userId")
        UserDefaults.standard.set(userAccount.agency, forKey: "agency")
        UserDefaults.standard.set(userAccount.balance, forKey: "balance")
        UserDefaults.standard.set(userAccount.bankAccount, forKey: "bankAccount")
        UserDefaults.standard.set(userAccount.name, forKey: "name")
        UserDefaults.standard.set(userAccount.userName, forKey: "userName")
        let result = UserDefaults.retrieveData()
        
        XCTAssertEqual(result.userId, userAccount.userId)
        XCTAssertEqual(result.agency, userAccount.agency)
        XCTAssertEqual(result.balance, userAccount.balance)
        XCTAssertEqual(result.bankAccount, userAccount.bankAccount)
        XCTAssertEqual(result.name, userAccount.name)
        XCTAssertEqual(result.userName, userAccount.userName)
    }
    
    
    func test_saveData(){
        let userAccount = UserAccount(userId: 2, name: "Erika Albizzati", bankAccount: "010278893-9", agency: "0207", balance: -3.56, userName: "ealbizzati@gmail.com")

        UserDefaults.saveUserInUserDefaults(userAccount: userAccount, userName: userAccount.userName!)
        
        let id = UserDefaults.standard.integer(forKey: "userId")
        let name = UserDefaults.standard.string(forKey: "name")
        let agency = UserDefaults.standard.string(forKey: "agency")
        let bankAccount = UserDefaults.standard.string(forKey: "bankAccount")
        let balance = UserDefaults.standard.float(forKey: "balance")
        let userName = UserDefaults.standard.string(forKey: "userName")

        
        XCTAssertEqual(id, userAccount.userId)
        XCTAssertEqual(agency, userAccount.agency)
        XCTAssertEqual(balance, userAccount.balance)
        XCTAssertEqual(bankAccount, userAccount.bankAccount)
        XCTAssertEqual(name, userAccount.name)
        XCTAssertEqual(userName, userAccount.userName)
    }
}
