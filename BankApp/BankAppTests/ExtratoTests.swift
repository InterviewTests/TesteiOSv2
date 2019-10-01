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

class MockExtratoPresentationLogic: ExtratoPresentationLogic {
    var isExtratoCalled = false
    
    func presentSomething(response: Extrato.Something.Response) {
        isExtratoCalled = true
    }
}

class MockExtratoDisplayLogic: ExtratoDisplayLogic {
    var isDisplayCalled = false
    func displayStatementList(responseExtrato: Extrato.Something.Response) {
        isDisplayCalled = true
    }
}

class ExtratoTests: XCTestCase {

    var worker: ExtratoWorker?
    var interactor: ExtratoInteractor?
    var presenter: ExtratoPresenter?
    var viewController: ExtratoViewController?
    var router: ExtratoRouter?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        worker = ExtratoWorker()
        interactor = ExtratoInteractor()
        presenter = ExtratoPresenter()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExtratiViewController") as? ExtratoViewController
        router = ExtratoRouter()
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
        worker?.doExtratoWork { (response) in
            XCTAssertNotNil(response)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testInteractor() {
        
        let mockWorker = MockExtratoWorker()
        let request = Extrato.Something.Request()
        let mockPresentationLogic = MockExtratoPresentationLogic()
        
        interactor?.worker = mockWorker
        interactor?.presenter = mockPresentationLogic
        interactor?.doExtrato(request: request)
        
        XCTAssert(mockWorker.isExtratoCalled)
        
        XCTAssert(mockWorker.isExtratoCalled)
        
        XCTAssertNotNil(mockWorker.response)
    }
    
    func testPresenter() {
        
        let mockDisplayLogic =  MockExtratoDisplayLogic()
        
        let statements = [Extrato.Something.Statement(title: "Pagamento", desc: "Luz", date: "2019-09-17", value: -130.54), Extrato.Something.Statement(title: "Pagamento", desc: "Faculdade", date: "2019-09-10", value: -500.0),Extrato.Something.Statement(title: "Pagamento", desc: "Internet", date: "2019-09-23", value: -89.90)]
        
        let response = Extrato.Something.Response(statementList: statements, error: nil)
        
        presenter?.viewController = mockDisplayLogic
        presenter?.presentSomething(response: response)
        
        XCTAssert(mockDisplayLogic.isDisplayCalled)
    }
    
    func testViewController() {
        
    }
}
