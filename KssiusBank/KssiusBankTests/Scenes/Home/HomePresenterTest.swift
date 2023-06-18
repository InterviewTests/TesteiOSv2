//
//  HomePresenterTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 18/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//


import XCTest
@testable import KssiusBank

final class HomePresenterTest: XCTestCase {

    // MARK: - Success present statements presenter

    func testSuccesDisplayStatements() {

        let viewControllerSpy = HomeViewControllerSpy()
        let sut = HomePresenter()
        sut.viewController = viewControllerSpy

        sut.presentStatements(response: .init(success: true,statements: Seeds.Statements.statements))
        let expectedStatements = Seeds.Statements.statements.map {
            Home.GetStatements.StatementViewModel(type: statements(type: $0.type),
                                                  description: $0.description,
                                                  date: $0.date.formatToString,
                                                  value: $0.value.toCurrency)
        }

        XCTAssertTrue(viewControllerSpy.displayStatementsCalled)
        XCTAssertTrue(viewControllerSpy.displayStatementsSuccess)
        XCTAssertEqual(viewControllerSpy.displayStatementsListStatements, expectedStatements)

    }

    // MARK: - Statements types

    private func statements(type: StatementsModel.StatementsType) -> String {
        switch type {
        case .payment:
            return L10n.Statement.Option.payment
        case .deposit:
            return L10n.Statement.Option.deposit
        case .invoice:
            return L10n.Statement.Option.invoice
        case .withdrawal:
            return L10n.Statement.Option.withdrawal
        }
    }

    // MARK: - Success present statements presenter

    func testSuccesDisplayAccount() {
        let seedUser = Seeds.user
        let viewControllerSpy = HomeViewControllerSpy()
        let sut = HomePresenter()
        sut.viewController = viewControllerSpy


        sut.presentAccount(response: .init(userAccount: seedUser))

        let expectedAccount: Home.GetAccount.ViewModel = .init(name: seedUser.name,
                                                               agency: seedUser.agency,
                                                               accountNumber: seedUser.accountNumber,
                                                               balance: seedUser.balance)

        XCTAssertTrue(viewControllerSpy.displayAccountCalled)
        XCTAssertEqual(viewControllerSpy.displayAccountViewModel, expectedAccount)

    }
}

final class HomeViewControllerSpy: HomeDisplayLogic {

    var displayStatementsCalled = false
    var displayStatementsSuccess = false
    var displayStatementsListStatements = [Home.GetStatements.StatementViewModel]()

    var displayAccountCalled = false
    var displayAccountViewModel:  Home.GetAccount.ViewModel = .init()

    func displayStatements(viewModel: Home.GetStatements.ViewModel) {
        displayStatementsCalled = true
        displayStatementsSuccess = viewModel.success
        displayStatementsListStatements = viewModel.statements
    }

    func displayAccount(viewModel: Home.GetAccount.ViewModel) {
        displayAccountCalled = true
        displayAccountViewModel = viewModel
    }


}
