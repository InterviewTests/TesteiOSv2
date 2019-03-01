//
//  ExtratoPresenterTests.swift
//  TesteiOSv2Tests
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class ExtratoPresenterTests: XCTestCase {
    
    var presenter: ExtratoPresenter!
    
    override func setUp() {
        presenter = ExtratoPresenter()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDisplayHeaderData(){
        let extratoViewControllerSpy = ExtratoViewControllerSpy()
        presenter.viewController = extratoViewControllerSpy
        
        if let headerData = mock(jsonFile: "userAccount"), let userAccount = UserAccountModel(data: headerData){
            presenter.presentHeader(response: Extrato.Header.Response(headerData: userAccount))
            XCTAssertTrue(extratoViewControllerSpy.successfullDisplayHeaderData)
        } else{
            XCTFail()
        }
    }

    func testDisplayStatement(){
        let extratoViewControllerSpy = ExtratoViewControllerSpy()
        presenter.viewController = extratoViewControllerSpy
        
        if let statementData = mock(jsonFile: "statements"), let statement = StatementModel(data: statementData){
            presenter.presentStatement(response: Extrato.Statement.Response(statementEntries: statement, userMessage: nil))
            XCTAssertTrue(extratoViewControllerSpy.successfullDisplayStatement)
        } else{
            XCTFail()
        }
    }

    class ExtratoViewControllerSpy: ExtratoViewController{
        var successfullDisplayHeaderData = false
        var successfullDisplayStatement = false
        
        override func displayHeaderData(viewModel: Extrato.Header.ViewModel) {
            successfullDisplayHeaderData = true
        }
        
        override func displayStatement(viewModel: Extrato.Statement.ViewModel) {
            successfullDisplayStatement = ( viewModel.entries != nil )
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
