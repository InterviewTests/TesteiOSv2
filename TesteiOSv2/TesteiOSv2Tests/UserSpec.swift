//
//  UserSpec.swift
//  TesteiOSv2Tests
//
//  Created by Brendoon Ryos on 14/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Nimble
import Quick

@testable import TesteiOSv2

class UserSpec: QuickSpec {
  override func spec() {
    describe("a user") {
      var user: User!
      
      beforeEach {
        let sampleData = BankAPI.login(username: "Test", password: "Test").sampleData
        let userAccount = try? JSONDecoder().decode(UserAccount.self, from: sampleData)
        user = userAccount?.user
      }
      it("should be able to create a user from json") {
        expect(user).notTo(beNil())
      }
      it("should have an id") {
        expect(user.id).notTo(beNil())
      }
      it("should have a name") {
        expect(user.name).notTo(beNil())
      }
      it("should have an agency") {
        expect(user.agency).notTo(beNil())
      }
      it("should have a bank account") {
        expect(user.bankAccount).notTo(beNil())
      }
      it("should have a balance") {
        expect(user.balance).notTo(beNil())
      }
    }
  }
}
