//
//  StatemetsSpec.swift
//  TesteiOSv2Tests
//
//  Created by Brendoon Ryos on 14/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Nimble
import Quick

@testable import TesteiOSv2

class StatemetsSpec: QuickSpec {
  override func spec() {
    describe("a statement list") {
      var statements: [Statement]!
      
      beforeEach {
        let sampleData = BankAPI.statements(userId: 1).sampleData
        let statementList = try? JSONDecoder().decode(StatementList.self, from: sampleData)
        statements = statementList?.statements
      }
      it("should be able to create a statement list from json") {
        expect(statements).toNot(beNil())
      }
    }
  }
}
