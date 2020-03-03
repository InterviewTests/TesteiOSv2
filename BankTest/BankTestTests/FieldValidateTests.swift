//
//  FieldValidateTests.swift
//  BankTestTests
//
//  Created by Luan Nascimento Almeida on 03/03/20.
//  Copyright © 2020 bank. All rights reserved.
//

import XCTest
@testable import BankTest

class FieldValidateTests: XCTestCase {

    func testCheckAnEmailIsValid() {
        let emails = ["luan.vna@me.com", "luan@me.com", "emailNovo@gmail.co", "novoteste@dd.ka"]
        for email in emails {
            assert(email.isValidEmail(), "O e-mail \(email) não esta correto")
        }
    }

    func testCheckAnEmailInvalid() {
        let emails = ["luanme.com", "www.meuemail.com.br", "emailNovo@.co", "nov oteste@dd.ka"]
        for email in emails {
            assert(!email.isValidEmail(), "O e-mail \(email) correto")
        }
    }

    func testCheckAnDocumentValid() {
        let isValidEmail = "39648264801".isValidCPF()
        assert(isValidEmail, "Validando CPF correto")
    }

}
