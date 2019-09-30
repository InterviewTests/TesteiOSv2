//
//  ExtratoTests.swift
//  BankAppTests
//
//  Created by Victor Hugo Martins Lisboa on 30/09/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import XCTest
@testable import BankApp

class MockExtratoWorker: ExtratoWorker {
    
    var isExtratoCalled = false
    var response: Extrato.Something.Response?
    
    override func doExtratoWork(completion: @escaping((Extrato.Something.Response) -> Void)) {
        isExtratoCalled = true
        
        let statements = [Extrato.Something.Statement(title: "Pagamento", desc: "Luz", date: "2019-09-17", value: -130.54), Extrato.Something.Statement(title: "Pagamento", desc: "Faculdade", date: "2019-09-10", value: -500.0),Extrato.Something.Statement(title: "Pagamento", desc: "Internet", date: "2019-09-23", value: -89.90)]
        response = Extrato.Something.Response(statementList: statements, error: nil)
        
        completion(response!)
    }
}

class ExtratoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    let worker = ExtratoWorker()
    let interactor = ExtratoInteractor()
    let presenter = ExtratoPresenter()
    let viewController = ExtratoViewController()
    let router = ExtratoRouter()
    
    func testWorker() {
        let expectation = XCTestExpectation(description: "HTTP Request")
        worker.doExtratoWork { (response) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testInteractor() {
        let mockWorker = MockExtratoWorker()
        let request = Extrato.Something.Request()
        
        interactor.worker = mockWorker
        interactor.doExtrato(request: request)
        
        XCTAssert(mockWorker.isExtratoCalled)
        
        XCTAssertNotNil(mockWorker.response)
    }
    
    func testPresenter() {
        
    }
    
    func testViewController() {
        
    }
}
