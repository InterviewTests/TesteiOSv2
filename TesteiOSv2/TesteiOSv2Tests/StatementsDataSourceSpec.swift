//
//  StatementsDataSourceSpec.swift
//  TesteiOSv2Tests
//
//  Created by Brendoon Ryos on 14/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Nimble
import Quick

@testable import TesteiOSv2

class StatementsDataSourceSpec: QuickSpec {
  override func spec() {
    describe("a StatementsDataSource") {
      var dataSource: StatementsDataSource!
      var statements: [Statement]!
      var tableView: UITableView!
      
      beforeEach {
        let sampleData = BankAPI.statements(userId: 1).sampleData
        let statementList = try? JSONDecoder().decode(StatementList.self, from: sampleData)
        statements = statementList?.statements
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        dataSource = StatementsDataSource()
        dataSource.tableView = tableView
        dataSource.statements = statements
        tableView.dataSource = dataSource
      }
      it("should have a valid dataSource") {
        expect(dataSource).toNot(beNil())
      }
      it("should have the expected number of items") {
        let count = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        expect(count).to(equal(4))
      }
      it("should have be able to update items") {
        dataSource.statements = [statements.first!,statements.last!]
        let count = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        expect(count).to(equal(2))
      }
      it("should return the expected cell") {
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        expect(cell).to(beAKindOf(StatementTableViewCell.self))
      }
    }
  }
}
