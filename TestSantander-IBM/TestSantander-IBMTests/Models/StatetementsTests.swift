//
//  StatetementsTests.swift
//  TestSantander-IBMTests
//
//  Created by Erika Albizzati on 27/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import XCTest
@testable import TestSantander_IBM

class StatetementsTests: XCTestCase {
    func testeInit_Statement(){
        let statement = Statements(title: "Teste Titulo", desc: "Descricao", date: "2018-12-12", value: 100.23)
        XCTAssertEqual(statement.title, "Teste Titulo")
        XCTAssertEqual(statement.desc, "Descricao")
        XCTAssertEqual(statement.date, "2018-12-12")
        XCTAssertEqual(statement.value, 100.23)
    }
}
