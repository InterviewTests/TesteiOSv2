//
//  HelpersTests.swift
//  BankTests
//
//  Created by Administrador on 08/03/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import XCTest
@testable import Bank

class HelpersTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testValidEmail() {
        XCTAssert(Helpers.isValidEmail(email: "jefersontakumi@gmail.com"), "Erro na validação de um email válido")
    }
    
    func testInvalidEmail() {
        XCTAssertFalse(Helpers.isValidEmail(email: "jefersontakumigmail.com"), "Erro na validação de um email inválido")
    }

    func testValidCPF() {
        XCTAssert(Helpers.isValidCPF(cpf: "17525609063"), "Erro na validação de um cpf válido")
    }
    
    func testValidCPFWithDots() {
        XCTAssert(Helpers.isValidCPF(cpf: "175.256.090-63"), "Erro na validação de um cpf válido")
    }

    func testInvalidCPF() {
        XCTAssertFalse(Helpers.isValidCPF(cpf: "17525609060"), "Erro na validação de um cpf inválido")
    }
    
    func testCurrency() {
        XCTAssert(Helpers.formmaterCurrency(value: 1.0) == "R$  1,00", "Erro na formatação da moeda PT-BR")
    }
}
