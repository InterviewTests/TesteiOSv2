//
//  PasswordValidation.swift
//  TesteiOSv2Tests
//
//  Created by Gilson Gil on 18/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

// swiftlint:disable function_body_length
@testable import TesteiOSv2

import Quick
import Nimble

final class PasswordValidationSpec: QuickSpec {
  // MARK: Subject under test
  override func spec() {
    describe("password validation") {
      context("valid password") {
        let password = "Qq!1"
        it("should validate password") {
          let isValid = PasswordValidation.validate(value: password)
          expect(isValid).to(equal(true))
        }
      }

      context("without upper cased letter") {
        let password = "qq!1"
        it("should not validate password") {
          let isValid = PasswordValidation.validate(value: password)
          expect(isValid).to(equal(false))
        }
      }

      context("without special character") {
        let password = "Qq11"
        it("should not validate password") {
          let isValid = PasswordValidation.validate(value: password)
          expect(isValid).to(equal(false))
        }
      }

      context("without digit") {
        let password = "Qq!!"
        it("should not validate password") {
          let isValid = PasswordValidation.validate(value: password)
          expect(isValid).to(equal(false))
        }
      }

      context("without upper cased letter and special character") {
        let password = "qq11"
        it("should not validate password") {
          let isValid = PasswordValidation.validate(value: password)
          expect(isValid).to(equal(false))
        }
      }

      context("without upper cased letter and digit") {
        let password = "qq!!"
        it("should not validate password") {
          let isValid = PasswordValidation.validate(value: password)
          expect(isValid).to(equal(false))
        }
      }

      context("without upper cased letter and special character and digit") {
        let password = "qqqq"
        it("should not validate password") {
          let isValid = PasswordValidation.validate(value: password)
          expect(isValid).to(equal(false))
        }
      }

      context("without special character and digit") {
        let password = "Qqqq"
        it("should not validate password") {
          let isValid = PasswordValidation.validate(value: password)
          expect(isValid).to(equal(false))
        }
      }

      context("empty") {
        let password = ""
        it("should not validate password") {
          let isValid = PasswordValidation.validate(value: password)
          expect(isValid).to(equal(false))
        }
      }

      context("nil password") {
        let password: String? = nil
        it("should not validate password") {
          let isValid = PasswordValidation.validate(value: password)
          expect(isValid).to(equal(false))
        }
      }
    }
  }
}
