//
//  ExtratoViewControllerTests.swift
//  TesteiOSv2Tests
//
//  Created by Marcel Mendes Filho on 28/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import XCTest
@testable import TesteiOSv2

class ExtratoViewControllerTests: XCTestCase {
    
    var viewController: ExtratoViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupLoginViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    func setupLoginViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        viewController = storyboard.instantiateViewController(withIdentifier: "ExtratoViewController") as? ExtratoViewController
    }
    
    func loadView()
    {
        window.addSubview(viewController.view)
        RunLoop.current.run(until: Date())
    }
    
    func testRetrieveStatement(){
        let extratoBusinessLogicSpy = ExtratoBusinessLogicSpy()
        viewController.interactor = extratoBusinessLogicSpy
        loadView()
        
        // When
        viewController.viewDidAppear(true)
        
        // Then
        XCTAssertTrue(extratoBusinessLogicSpy.retrieveStatementCalled)
    }

    func testFormatHeader(){
        let extratoBusinessLogicSpy = ExtratoBusinessLogicSpy()
        viewController.interactor = extratoBusinessLogicSpy
        loadView()
        
        // When
        viewController.viewDidAppear(true)
        
        // Then
        XCTAssertTrue(extratoBusinessLogicSpy.formatHeaderCalled)
    }
    
    class ExtratoBusinessLogicSpy: ExtratoBusinessLogic{
        var retrieveStatementCalled = false
        var formatHeaderCalled = false
        
        func retrieveStatement() {
            retrieveStatementCalled = true
        }
        
        func formatHeader(request: Extrato.Header.Request) {
            formatHeaderCalled = true
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
