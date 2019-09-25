//
//  StatementViewControllerTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 25/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class StatementViewControllerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func getViewController(loading: Bool) -> StatementViewController? {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "Statement")
            as? StatementViewController else {
                return nil
        }
        
        if loading {
            let user = User(userId: 1, name: "Teste Mockado", bankAccount: "123", agency: "456", balance: 123)
            
            vc.router?.dataStore?.user = user
            
            let _ = vc.view // so it will call viewDidLoad() 😉
        }
        
        return vc
    }
    
    func testLoading() {
        guard let vc = getViewController(loading: true) else { fail() ; return }

        XCTAssertNotNil(vc)
    }
}
