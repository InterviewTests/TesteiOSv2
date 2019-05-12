//
//  StatementsPresenterTests.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

@testable import TesteSantander
import XCTest

class StatementsPresenterTests: XCTestCase {
    // MARK: Subject under test
  
    var sut: StatementsPresenter!
  
    // MARK: Test lifecycle
  
    override func setUp() {
        super.setUp()
        setupStatementsPresenter()
    }
  
    // MARK: Test setup
  
    func setupStatementsPresenter() {
        sut = StatementsPresenter()
    }
  
    // MARK: Test doubles
  
    class StatementsDisplayLogicSpy: StatementsDisplayLogic {
        var displayDataIsCalled = false
        var displayHeaderIsCalled = false
        
        func displayData(viewModel: StatementsModel.Fetch.ViewModel) {
            displayDataIsCalled = true
        }
        
        func displayHeaderData(viewModel: StatementsModel.Header.ViewModel) {
            displayHeaderIsCalled = true
        }
    }
  
    // MARK: Tests
    
    func testFetchStatement() {
        let viewControllerSpy = StatementsDisplayLogicSpy()
        sut.viewController = viewControllerSpy
        let statement = Statement(title: "",
                                  desc: "",
                                  date: "",
                                  value: 0)
        let statementList = StatementList(statementList: [statement], error: nil)
        let response = StatementsModel.Fetch.Response(statements: statementList)
        
        sut.presentFetchStatements(response: response)

        XCTAssertTrue(viewControllerSpy.displayDataIsCalled)
    }
    
    func testFetchHeader() {
        let viewControllerSpy = StatementsDisplayLogicSpy()
        sut.viewController = viewControllerSpy
        let response = StatementsModel.Header.Response(headerData: nil)
        
        sut.setupHeader(data: response)
        XCTAssertTrue(viewControllerSpy.displayHeaderIsCalled)
    }
}
