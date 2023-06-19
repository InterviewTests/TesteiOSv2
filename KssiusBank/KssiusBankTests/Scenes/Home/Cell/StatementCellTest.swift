//
//  StatementCellTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 19/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

import XCTest
@testable import KssiusBank

final class StatementCellTest: XCTestCase {


    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Success display statement

    func testSuccesDisplayStatement() {
        let sut = StatementCell()
        let balanceLabelSpy = LabelSpy()
        let dateLabelSpy = LabelSpy()
        let descriptionLabelSpy = LabelSpy()
        let typeLabelSpy = LabelSpy()

        sut.balanceLabel = balanceLabelSpy
        sut.dateLabel = dateLabelSpy
        sut.descriptionLabel = descriptionLabelSpy
        sut.typeLabel = typeLabelSpy

        sut.setup(model: .init(type: "type" , description: "description", date: "date", value: "108.9"))

        XCTAssertEqual(typeLabelSpy.text, "type")
        XCTAssertEqual(dateLabelSpy.text, "date")
        XCTAssertEqual(descriptionLabelSpy.text, "description")
        XCTAssertEqual(balanceLabelSpy.text, "108.9")

    }

    // MARK: - Success reusable display statement

    func testSuccesReusabelDisplayStatement() {
        let sut = StatementCell()
        let balanceLabelSpy = LabelSpy()
        let dateLabelSpy = LabelSpy()
        let descriptionLabelSpy = LabelSpy()
        let typeLabelSpy = LabelSpy()

        sut.balanceLabel = balanceLabelSpy
        sut.dateLabel = dateLabelSpy
        sut.descriptionLabel = descriptionLabelSpy
        sut.typeLabel = typeLabelSpy

        sut.setup(model: .init(type: "type" , description: "description", date: "date", value: "108.9"))
        sut.setup(model: .init(type: "type2" , description: "description2", date: "date2", value: "100"))

        XCTAssertEqual(typeLabelSpy.text, "type2")
        XCTAssertEqual(dateLabelSpy.text, "date2")
        XCTAssertEqual(descriptionLabelSpy.text, "description2")
        XCTAssertEqual(balanceLabelSpy.text, "100")



    }
}
