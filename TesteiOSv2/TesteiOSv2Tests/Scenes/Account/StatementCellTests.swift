//
//  StatementCellTests.swift
//  TesteiOSv2Tests
//
//  Created by Gilson Gil on 18/02/19.
//  Copyright © 2019 Gilson Gil. All rights reserved.
//

@testable import TesteiOSv2

import Quick
import Nimble

final class StatementCellSpec: QuickSpec {
  // MARK: Subject under test
  override func spec() {
    let sut = StatementCell(style: .default, reuseIdentifier: StatementCell.reuseIdentifier)

    describe("given a statement cell") {
      context("is updated with a statemente") {
        it("should display statement details correctly") {
          let title = "Pagamento"
          let description = "Boleto"
          let date = Date()
          let value = -80
          let dateString = DateFormatter.displayDateFormatter.string(from: date)
          let valueString = NumberFormatter.currencyFormatter.string(from: NSNumber(value: value)) ?? "\(value)"
          let displayedStatement = Account.FetchStatements.ViewModel.DisplayedStatement(title: title,
                                                                                        description: description,
                                                                                        date: dateString,
                                                                                        value: valueString)
          sut.update(with: displayedStatement)

          expect(sut.titleLabel.text).to(equal(title))
          expect(sut.descriptionLabel.text).to(equal(description))
          expect(sut.dateLabel.text).to(equal(dateString))
          expect(sut.valueLabel.text).to(equal(valueString))
        }
      }
    }
  }
}

