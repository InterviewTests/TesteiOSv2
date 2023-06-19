//
//  HomeViewControllerTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 18/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import XCTest
@testable import KssiusBank

final class HomeViewControllerTest: XCTestCase {


    // MARK: - Verify fetch user on viewDidLoad

    func testGetUserCalledWhenViewDidLoad() {

        let interactorSpy = HomeInteractorSpy()

        let viewController = HomeViewController()
        viewController.interactor = interactorSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()


        viewController.viewDidLoad()


        XCTAssertTrue(interactorSpy.retrieveAccountCalled)
    }

    // MARK: - Verify fetch user on viewDidLoad

    func testFetchStatementsCalledWhenViewDidLoad() {

        let interactorSpy = HomeInteractorSpy()

        let viewController = HomeViewController()
        viewController.interactor = interactorSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()


        viewController.viewDidLoad()

        XCTAssertTrue(interactorSpy.fetchStatementsCalled)
    }

    // MARK: - Test display account data

    func testShowAccountData() {
        let viewController = HomeViewController()

        let nameLabel = LabelSpy()
        let accountNumberLabel = LabelSpy()
        let balanceLabel = LabelSpy()

        viewController.nameLabel = nameLabel
        viewController.accountLabel = accountNumberLabel
        viewController.balanceLabel = balanceLabel

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()

        let seed = Seeds.user
        let viewModel: Home.GetAccount.ViewModel = .init(name: seed.name,
                                                         agency: seed.agency,
                                                         accountNumber: seed.accountNumber,
                                                         balance: seed.balance)
        viewController.displayAccount(viewModel: viewModel)

        let expectedAccountNumber = "\(seed.agency) / \(seed.accountNumber.toAccountFormat ?? "")"
        XCTAssertEqual(nameLabel.text, seed.name)
        XCTAssertEqual(accountNumberLabel.text, expectedAccountNumber)
        XCTAssertEqual(balanceLabel.text, seed.balance.toCurrency)

    }

    // MARK: - Test display statements

    func testShowStatements() {
        let viewController = HomeViewController()

        let statementsTable = TableViewSpy()
        viewController.tableView = statementsTable

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()

        let seed = Seeds.Statements.statements.first

        let viewModel: Home.GetStatements.ViewModel = .init(statements: [
            .init(type: "", description: seed?.description ?? "", date: seed?.date.formatToString ?? "", value: seed?.value.toCurrency ?? "")
        ], success: true)

        viewController.displayStatements(viewModel: viewModel)
        
        XCTAssertTrue(statementsTable.reloadDataCalled)

    }
}

final class HomeInteractorSpy: HomeBusinessLogic, HomeDataStore {


    var userAccount: UserAccountModel?
    var statements = [StatementsModel]()

    var fetchStatementsCalled = false
    var retrieveAccountCalled = false

    func fetchStatements(request: Home.GetStatements.Request) {
        fetchStatementsCalled = true
    }

    func retrieveAccount(request: Home.GetAccount.Request) {
        retrieveAccountCalled = true
    }

}
