//
//  StatementInteractorTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 26/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class StatementInteractorTests: XCTestCase {

    //Inicializa o interactor utilizado no statement
    var sut: StatementInteractor!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        sut = StatementInteractor()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    class StatementPresentationLogicSpy: StatementPresentationLogic {
        var presentStatementCalled = false
        
        func presentStatement(_ response: Statement.StatementApi.Response) {
            presentStatementCalled = true
        }
    }
    
    func testSuccessfullStatement() {
        // Given
        let spy = StatementPresentationLogicSpy()
        sut.presenter = spy
        
        // When
        let request = Statement.StatementApi.Request(userId: 1)
        sut.mockStatement(request: request)
        
        //Then
        XCTAssertTrue(spy.presentStatementCalled, "A função de retorno do extrato na view foi chamada")
    }
}
