//
//  BankAppTests.swift
//  BankAppTests
//
//  Created by Marcus Titton on 23/09/19.
//  Copyright © 2019 Marcus Titton. All rights reserved.
//

import XCTest
@testable import BankApp

class BankAppTests: XCTestCase {
    
    //Função que valida uma senha 100% valida
    func testValidPassword() {
        let password = "Test@2" //Senha correta
        XCTAssertEqual(password.validaSenha(), true)
    }
    
    //Função que valida que uma senha sem letra maiuscula retorna FALSE
    func testValidPassword_NoUppercase() {
        let password = "test@2" //Senha sem a letra maiuscula
        XCTAssertEqual(password.validaSenha(), false)
    }
    
    //Função que valida que uma senha sem caracter especial retorna FALSE
    func testValidPassword_NoSpecialCharacter() {
        let password = "Test2" //Senha sem o caracter especial
        XCTAssertEqual(password.validaSenha(), false)
    }
    
    //Função que valida que uma senha sem numero retorna FALSE
    func testValidPassword_NoNumber() {
        let password = "Test@" //Senha sem o numero
        XCTAssertEqual(password.validaSenha(), false)
    }
    
    //Função que valida se determinada string só contem numeros
    func testIsNumber() {
        let number = "342423423"
        XCTAssertEqual(number.isNumber(), true)
    }
    
    //Função que valide se determinada string que deveria conter somente numeros, há alguma letra (retorna FALSE)
    func testIsNotNumber() {
        let number = "432jbjh432"
        XCTAssertEqual(number.isNumber(), false)
    }
    
    //Função que garante que a data sempre estará no formato dd/MM/yyyy se a entrada for yyyy/MM/dd
    func testDateFormatter() {
        let date = "2019-09-23"
        XCTAssertEqual(date.formataData(), "23/09/2019")
    }
    
    //Função que garante que o retorno da moeda sempre será no formato R$ XX,YY (com duas casas decimais) para campos double
    func testMoneyFormatter() {
        let money = 2.35
        XCTAssertEqual(money.formataMoeda(), "R$ 2,35")
    }
}
