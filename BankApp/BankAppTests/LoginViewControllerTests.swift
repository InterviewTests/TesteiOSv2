//
//  LoginViewControllerTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 25/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class LoginViewControllerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func getViewController(loading: Bool) -> LoginViewController? {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "Login")
            as? LoginViewController else {
                return nil
        }
        
        if loading {
            let _ = vc.view // so it will call viewDidLoad() 😉
        }
        
        return vc
    }
    
    func testLoading() {
        guard let vc = getViewController(loading: true) else { fail() ; return }
        
        XCTAssert(vc.txt_user != nil,
                  "Campo de usuario criado")
        XCTAssert(vc.txt_password != nil,
                  "Campo de senha criado")
    }
}

extension XCTestCase {
    
    func fail() {
        XCTAssert(false, "Falha!")
    }
    
}
