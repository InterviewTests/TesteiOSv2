//
//  LoginTests.swift
//  Bank-App-CleanSwiftTests
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation
import Nimble
import Quick

@testable import Bank_App_CleanSwift

class LoginFieldsValidationSpec: QuickSpec {
    var fieldsValidator: LoginFieldsValidationWorker!
            
    override func spec() {
        beforeEach {
            self.fieldsValidator = LoginFieldsValidationWorker()
        }
        
        describe("#validateUsername") {
            context("when cpf and password are correct") {
                it("returns true") {
                    expect(self.fieldsValidator.validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITH_DOTS_AND_BAD_PASSWORD)).to(beTrue())
                }
                
                it("returns true") {
                    expect(self.fieldsValidator.validate(user: LoginDoubles.USER_WITH_GOOD_CPF_WITHOUT_DOTS_AND_BAD_PASSWORD)).to(beTrue())
                }
            }
            
            context("when email and password are correct") {
                it("returns true") {
                    expect(self.fieldsValidator.validate(user: LoginDoubles.USER_WITH_GOOD_EMAIL_AND_GOOD_PASSWORD)).to(beTrue())
                }
            }
        }
    }
}
