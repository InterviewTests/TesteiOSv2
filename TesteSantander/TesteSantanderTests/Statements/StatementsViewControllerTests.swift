//
//  StatementsViewControllerTests.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class StatementsViewControllerTests: XCTestCase {
    // MARK: Subject under test
  
    var sut: StatementsViewController!
    var window: UIWindow!
  
    // MARK: Test lifecycle
  
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupStatementsViewController()
    }
  
    override func tearDown() {
        window = nil
        super.tearDown()
    }
  
    // MARK: Test setup
  
    func setupStatementsViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "StatementsViewController") as? StatementsViewController
    }
  
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
  
    // MARK: Test doubles
  
    class StatementsBusinessLogicSpy: StatementsBusinessLogic {
        var fecthStatementIsCalled = false
        var fecthHeaderIsCalled = false
        
        func fetchStatements() {
            fecthStatementIsCalled = true
        }
        
        func fetchHeader(data: StatementsModel.Header.Request) {
            fecthHeaderIsCalled = true
        }
    }
  
    // MARK: Tests
    
    func testFetchHeader() {
        // Given
        let spy = StatementsBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        // Then
        XCTAssertTrue(spy.fecthHeaderIsCalled)
    }
    
    func testFetchStatements() {
        // Given
        let spy = StatementsBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        // Then
        XCTAssertTrue(spy.fecthStatementIsCalled)
    }
    
    func testSetupHeader() {
        // When
        loadView()
        let viewModel = StatementsModel.Header.ViewModel(name: "Jose da Silva Teste",
                                                         account: "2050/012314564",
                                                         balance: "R$ 10,00")
        sut.displayHeaderData(viewModel: viewModel)
        
        //Then
        XCTAssertEqual(sut.nameLabel.text, "Jose da Silva Teste")
        XCTAssertEqual(sut.accountLabel.text, "2050/012314564")
        XCTAssertEqual(sut.balanceLabel.text, "R$ 10,00")
    }
    
    func testSetupStatement() {
        // When
        loadView()
        let statement = Statement(title: "",
                                  desc: "",
                                  date: "",
                                  value: 0)
        
        let viewModel = StatementsModel.Fetch.ViewModel(statementEntries: [statement])
        sut.displayData(viewModel: viewModel)
        
        // Then
        XCTAssertEqual(sut.statementList.count, 1)
    }
}
