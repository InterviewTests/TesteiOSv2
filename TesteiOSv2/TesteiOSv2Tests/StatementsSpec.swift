//
//  StatementsSpec.swift
//  TesteiOSv2Tests
//
//  Created by Brendoon Ryos on 14/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Nimble
import Quick

@testable import TesteiOSv2

class StatementsSpec: QuickSpec {
  override func spec() {
    describe("a statement list") {
      var statements: [Statement]!
      var statement: Statement!
      
      beforeEach {
        let sampleData = BankAPI.statements(userId: 1).sampleData
        let statementList = try? JSONDecoder().decode(StatementList.self, from: sampleData)
        statements = statementList?.statements
        statement = statements.first
      }
      it("should be able to create a statement list from json") {
        expect(statements).toNot(beNil())
      }
      it("should have 4 statements loaded from json") {
        expect(statements.count).to(be(4))
      }
      describe("a statement") {
        it("should have a title") {
          expect(statement.title).notTo(beNil())
        }
        it("should have a description") {
          expect(statement.description).notTo(beNil())
        }
        it("should have a date") {
          expect(statement.date).notTo(beNil())
        }
        it("should have a value") {
          expect(statement.value).notTo(beNil())
        }
      }
    }
  }
}
