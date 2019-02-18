//
//  CPFValidation.swift
//  TesteiOSv2Tests
//
//  Created by Gilson Gil on 18/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

@testable import TesteiOSv2

import Quick
import Nimble

final class CPFValidationSpec: QuickSpec {
  // MARK: Subject under test
  override func spec() {
    describe("cpf validation") {
      context("valid cpf") {
        let cpf = "12345678900"
        it("should validate cpf") {
          let isValid = CPFValidation.validate(value: cpf)
          expect(isValid).to(equal(true))
        }
      }

      context("digits only wrong length cpf") {
        let cpf = "125367112362135"
        it("should not validate cpf") {
          let isValid = CPFValidation.validate(value: cpf)
          expect(isValid).to(equal(false))
        }
      }

      context("alphanumeric only wrong length cpf") {
        let cpf = "125367A23F2HI35"
        it("should not validate cpf") {
          let isValid = CPFValidation.validate(value: cpf)
          expect(isValid).to(equal(false))
        }
      }

      context("alphanumeric with valid length cpf") {
        let cpf = "ABC123DDF09"
        it("should not validate cpf") {
          let isValid = CPFValidation.validate(value: cpf)
          expect(isValid).to(equal(false))
        }
      }

      context("empty cpf") {
        let cpf = ""
        it("should not validate cpf") {
          let isValid = CPFValidation.validate(value: cpf)
          expect(isValid).to(equal(false))
        }
      }

      context("nil cpf") {
        let cpf: String? = nil
        it("should not validate cpf") {
          let isValid = CPFValidation.validate(value: cpf)
          expect(isValid).to(equal(false))
        }
      }
    }
  }
}
