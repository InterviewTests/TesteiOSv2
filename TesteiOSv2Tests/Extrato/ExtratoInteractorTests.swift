//
//  ExtratoInteractorTests.swift
//  TesteiOSv2Tests
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class ExtratoInteractorTests: XCTestCase {
    
    var interactor: ExtratoInteractor!
    
    override func setUp() {
        interactor = ExtratoInteractor()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFormatHeader(){
        let extratoPresentationLogicSpy = ExtratoPresentationLogicSpy()
        interactor.presenter = extratoPresentationLogicSpy
        
        interactor.formatHeader(request: Extrato.Header.Request())
        
        XCTAssertTrue(extratoPresentationLogicSpy.presentHeaderCalled)
    }
    
    func testPresentStatement(){
        let extratoPresentationLogicSpy = ExtratoPresentationLogicSpy()
        let extratoWorkerMock = ExtratoWorkerMock()
        interactor.presenter = extratoPresentationLogicSpy
        interactor.worker = extratoWorkerMock
        
        interactor.retrieveStatement()
    }
    
    class ExtratoWorkerMock: ExtratoWorker{
        override func retrieveStatement(completionResult: @escaping (StatementModel?, Bool) -> Void) {
            if let data = mock(jsonFile: "statements"), let statement = StatementModel(data: data){
                completionResult(statement, true)
            } else {
                completionResult(nil, false)
            }
        }
        
        private func mock(jsonFile: String) -> Data? {
            if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
                let url = URL(fileURLWithPath: path)
                guard let data = try? Data(contentsOf: url) else {
                    fatalError("Error parse json to Data")
                }
                return data
            } else {
                return nil
            }
        }
    }
    
    class ExtratoPresentationLogicSpy: ExtratoPresentationLogic{
        var presentHeaderCalled = false
        var presentStatementCalled = false
        
        func presentStatement(response: Extrato.Statement.Response) {
            presentStatementCalled = true
        }
        
        func presentMessageToUser(response: Extrato.Statement.Response) {
            _ = 0
        }
        
        func presentHeader(response: Extrato.Header.Response) {
            presentHeaderCalled = true
        }
    }


}
