//
//  StatementCellTests.swift
//  TestSantander-IBMTests
//
//  Created by Erika Albizzati on 28/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class StatementCellTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_setCell(){
        let bundle = Bundle(for: StatementCell.self)
        guard let cell = bundle.loadNibNamed("StatementCell", owner: nil)?.first as? StatementCell else {
            return XCTFail()
        }
        
        let statement = StatementListScene.GetStatements.ViewModel.Statements(title: "Deposito", description: "Aluguel", date: "2017-10-10", value: 1920.00)

        cell.set(statement: statement)
        
        XCTAssert(cell.titleLabel.text == "Deposito")
        XCTAssert(cell.descriptionLabel.text == "Aluguel")
        XCTAssert(cell.dateLabel.text == "10/10/2017")
        XCTAssert(cell.valueLabel.text == "R$ 1920.00")
    }

}
