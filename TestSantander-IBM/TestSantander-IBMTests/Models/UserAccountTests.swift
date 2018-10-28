//
//  UserAccountTests.swift
//  TestSantander-IBMTests
//
//  Created by Erika Albizzati on 27/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class UserAccountTests: XCTestCase {
    func testeInit_UserId(){
        let user = UserAccount(userId: 10)
        XCTAssertEqual(user.userId, 10)
    }
    
    func testeInit_name(){
        let user = UserAccount(userId: 10, name: "José Alves")
        XCTAssertEqual(user.name, "José Alves")
    }
    
    func testeInit_bankAccount(){
        let user = UserAccount(userId: 10, bankAccount: "1572")
        XCTAssertEqual(user.bankAccount, "1572")
    }
    
    func testeInit_Agency(){
        let user = UserAccount(userId: 10, bankAccount: "97656")
        XCTAssertEqual(user.bankAccount, "97656")
    }
    
    func testeInit_Balance(){
        let user = UserAccount(userId: 10, balance: 100.23)
        XCTAssertEqual(user.balance, 100.23)
    }
    
    func testeInit_userName(){
        let user = UserAccount(userId: 10, userName: "teste@teste.com")
        XCTAssertEqual(user.userName, "teste@teste.com")
    }
    

}
