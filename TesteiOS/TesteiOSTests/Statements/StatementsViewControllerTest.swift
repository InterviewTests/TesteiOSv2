//
//  StatementsViewControllerTest.swift
//  TesteiOSTests
//
//  Created by Fabio Souza de Morais on 13/05/19.
//  Copyright © 2019 Fabio Morais. All rights reserved.
//

import XCTest

@testable import TesteiOS

class StatementsViewControllerTest: XCTestCase {

    var sut: StatementsViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupStatementsViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func setupStatementsViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "StatementsViewController") as? StatementsViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    class StatementsBusinessLogicSpy: StatementsBusinessLogic {
        var getStatementIsCalled = false
        var getHeaderIsCalled = false
        
        func getStatements() {
            getStatementIsCalled = true
        }
        
        func getHeader(data: StatementsModel.Header.Request) {
            getHeaderIsCalled = true
        }
    }
    
    // MARK: Tests
    
    func testFetchHeader() {
        let spy = StatementsBusinessLogicSpy()
        sut.interactor = spy
        loadView()

        XCTAssertTrue(spy.getHeaderIsCalled)
    }
    
    func testFetchStatements() {
        let spy = StatementsBusinessLogicSpy()
        sut.interactor = spy
        
        loadView()

        XCTAssertTrue(spy.getStatementIsCalled)
    }
    
    func testSetupHeader() {
        // When
        loadView()
        let viewModel = StatementsModel.Header.ViewModel(name: "Jose da Silva Teste",
                                                         account: "2050/012314564",
                                                         balance: "R$ 1000,00")
        sut.setHeaderData(viewModel: viewModel)
        
        //Then
        XCTAssertEqual(sut.userName.text, "Jose da Silva Teste")
        XCTAssertEqual(sut.accountNumber.text, "2050/012314564")
        XCTAssertEqual(sut.balance.text, "R$ 1000,00")
    }
    
    func testSetupStatement() {
        loadView()
        let statement = StatementList(title: "", accountName: "", date: "", accountValue: 0.0)
        
        let viewModel = StatementsModel.Fetch.ViewModel(statementEntries: [statement])
        sut.setData(viewModel: viewModel)
        
        XCTAssertEqual(sut.statementList.count, 1)
    }

}
