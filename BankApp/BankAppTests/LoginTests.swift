//
//  LoginTests.swift
//  BankAppTests
//
//  Created by Victor Lisboa on 26/09/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import XCTest
@testable import BankApp

class MockLoginWorker: LoginWorker {
    
    var isLoginCalled = false
    var response: Login.Something.Response?
    
    override func doLoginWork(user: String, password: String, completion: @escaping((Login.Something.Response) -> Void)) {
        isLoginCalled = true

        let userAccount = Login.Something.UserAccount(userId: 1, name: "José da Silva", bankAccount: "1234", agency: "567890", balance: 4.15)
        
        response = Login.Something.Response(userAccount: userAccount, error: nil)
        
        completion(response!)
    }
}

class MockLoginPresentationLogic: LoginPresentationLogic {
    var isLoginCalled = false
    func presentLogin() {
        isLoginCalled = true
    }
}

class MockLoginDisplayLogic: LoginDisplayLogic {
    var isDisplayCalled = false
    func presentExtrato() {
        isDisplayCalled = true
    }
}

class LoginTests: XCTestCase {
    
    var user: String?
    var password: String?
    var worker: LoginWorker?
    var interactor: LoginInteractor?
    var presenter: LoginPresenter?
    var viewController: LoginViewController?
    var router: LoginRouter?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        user = "Test@clean.swift"
        password = "Test@1"
        worker = LoginWorker()
        interactor = LoginInteractor()
        presenter = LoginPresenter()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        router = LoginRouter()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testWorker() {
        let expectation = XCTestExpectation(description: "HTTP Request")
        worker?.doLoginWork(user: user ?? "", password: password ?? "") { (response) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testInteractor() {

        let mockWorker = MockLoginWorker()
        let mockPresentationLogic = MockLoginPresentationLogic()
        var request = Login.Something.Request()

        request.user = user
        request.password = password

        interactor?.worker = mockWorker
        interactor?.presenter = mockPresentationLogic
        interactor?.doLogin(request: request)

        XCTAssert(mockPresentationLogic.isLoginCalled)
        
        XCTAssert(mockWorker.isLoginCalled)
        
        XCTAssertNotNil(mockWorker.response)
    }
    
    func testPresenter() {
        let mockDisplayLogic =  MockLoginDisplayLogic()
        presenter?.viewController = mockDisplayLogic
        presenter?.presentLogin()
        
        XCTAssert(mockDisplayLogic.isDisplayCalled)
    }
    
    func testViewController() {
        viewController?.userTextField = UITextField()
        viewController?.passwordTextField = UITextField()
        
        viewController?.userTextField.text = user
        viewController?.passwordTextField.text = password
        
        XCTAssertNotNil(viewController?.executeLogin())
    }
    
    func testRouter() {
        
    }
}


