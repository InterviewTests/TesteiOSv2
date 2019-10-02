//
//  ExtratoViewControllerTests.swift
//  BankAppTests
//
//  Created by Victor Hugo Martins Lisboa on 02/10/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import XCTest
@testable import BankApp

class ExtratoViewControllerTests: XCTestCase {
    
    var viewController: ExtratoViewController?
    var statements: [Extrato.Something.Statement]?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExtratoViewController") as? ExtratoViewController
        
        statements = [Extrato.Something.Statement(title: "Pagamento", desc: "Luz", date: "2019-09-17", value: -130.54), Extrato.Something.Statement(title: "Pagamento", desc: "Faculdade", date: "2019-09-10", value: 500.0)]
        
        
        viewController?.extratoTableView = UITableView()
        
        viewController?.statementList = statements
        viewController?.extratoTableView.register(UINib(nibName: "ExtratoCell", bundle: nil), forCellReuseIdentifier: "ExtratoCell")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewController() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    func testTableViewCell() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cell0 = viewController?.tableView(viewController!.extratoTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ExtratoTableViewCell
        
        XCTAssertEqual(cell0?.titleLabel.text, "Pagamento")
        XCTAssertEqual(cell0?.descLabel.text, "Luz")
        XCTAssertEqual(cell0?.dateLabel.text, "17/09/2019")
        XCTAssertEqual(cell0?.valueLabel.text, "-R$ 130,54")
        
        let cell1 = viewController?.tableView(viewController!.extratoTableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? ExtratoTableViewCell
        
        XCTAssertEqual(cell1?.titleLabel.text, "Pagamento")
        XCTAssertEqual(cell1?.descLabel.text, "Faculdade")
        XCTAssertEqual(cell1?.dateLabel.text, "10/09/2019")
        XCTAssertEqual(cell1?.valueLabel.text, "R$ 500,00")
    }
    
    func testCellProperties() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let numberOfRows = viewController?.tableView(viewController!.extratoTableView, numberOfRowsInSection: viewController?.statementList?.count ?? 0)
        let cellHeight = viewController?.tableView(viewController!.extratoTableView, heightForRowAt: IndexPath(row: 0, section: 0))
        let headerHeight = viewController?.tableView(viewController!.extratoTableView, heightForHeaderInSection: 0)
        let headerTitle = viewController?.tableView(viewController!.extratoTableView, titleForHeaderInSection: 0)
        
        XCTAssertEqual(numberOfRows, 2)
        XCTAssertEqual(cellHeight, 96)
        XCTAssertEqual(headerHeight, 40)
        XCTAssertEqual(headerTitle, "Recentes")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
