//
//  EmailValidationTests.swift
//  TesteiOSv2Tests
//
//  Created by Gilson Gil on 18/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

@testable import TesteiOSv2

import Quick
import Nimble

final class EmailValidationSpec: QuickSpec {
  // MARK: Subject under test
  override func spec() {
    describe("email validation") {
      context("valid email") {
        let email = "gilson.gil@me.com"
        it("should validate email") {
          let isValid = EmailValidation.validate(value: email)
          expect(isValid).to(equal(true))
        }
      }

      context("invalid email") {
        let email = "gilson.gil@me.c"
        it("should not validate email") {
          let isValid = EmailValidation.validate(value: email)
          expect(isValid).to(equal(false))
        }
      }

      context("empty email") {
        let email = ""
        it("should not validate email") {
          let isValid = EmailValidation.validate(value: email)
          expect(isValid).to(equal(false))
        }
      }

      context("nil email") {
        let email: String? = nil
        it("should not validate email") {
          let isValid = EmailValidation.validate(value: email)
          expect(isValid).to(equal(false))
        }
      }
    }
  }
}
