//
//  LoginViewController.swift
//  TesteIOSTests
//
//  Created by VM on 26/07/20.
//  Copyright © 2020 VM. All rights reserved.
//

@testable import TesteIOS
import XCTest

class LoginViewController: XCTestCase {
    
    var sut : LoginViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupLoginViewController()
    }

    func setupLoginViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
    }LoginViewController
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
