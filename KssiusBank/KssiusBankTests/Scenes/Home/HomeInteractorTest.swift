//
//  HomeInteractorTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 18/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import XCTest
@testable import KssiusBank

final class HomeInteractorTest: XCTestCase {

    // MARK: - Success fetch statements interactor

    func testSuccesFetchStatements() {
        let presenterSpy = HomePresenterSpy()
        let workerSpy = HomeWorkerSpy()
        let sut = HomeInteractor(presenter: presenterSpy, worker: workerSpy)

        sut.fetchStatements()

        //presenter
        XCTAssertTrue(presenterSpy.presentStatementsCalled)
        XCTAssertTrue(presenterSpy.presentStatementsSuccess)
        XCTAssertNil(presenterSpy.presentStatementsErrorMessage)
        XCTAssertEqual(Seeds.Statements.statements, presenterSpy.presentStatements)

        //worker
        XCTAssertTrue(workerSpy.workerFetchStatementsCalled)
    }

    // MARK: - Failure fetch statements interactor

    func testFailureFetchStatements() {
        let presenterSpy = HomePresenterSpy()
        let workerFailSpy = HomeWorkerFailSpy()
        let sut = HomeInteractor(presenter: presenterSpy, worker: workerFailSpy)

        sut.fetchStatements()

        //presenter
        XCTAssertTrue(presenterSpy.presentStatementsCalled)
        XCTAssertFalse(presenterSpy.presentStatementsSuccess)
        XCTAssertEqual(presenterSpy.presentStatementsErrorMessage, L10n.Network.Error.general)
        XCTAssertEqual(presenterSpy.presentStatements, [])

        //worker
        XCTAssertTrue(workerFailSpy.workerFetchStatementsCalled)
    }


    // MARK: - Success fetch account interactor

    func testSuccesFetchAccount() {
        let presenterSpy = HomePresenterSpy()
        let workerSpy = HomeWorkerSpy()
        let sut = HomeInteractor(presenter: presenterSpy, worker: workerSpy, userAccount: Seeds.user)

        sut.retrieveAccount()

        //presenter
        XCTAssertTrue(presenterSpy.presentAccountCalled)
        XCTAssertEqual(presenterSpy.presentAccount, Seeds.user)

        //worker
        XCTAssertFalse(workerSpy.workerFetchStatementsCalled)
    }

    // MARK: - Failure fetch account interactor

    func testFailureFetchAccount() {
        let presenterSpy = HomePresenterSpy()
        let workerFailSpy = HomeWorkerFailSpy()
        let sut = HomeInteractor(presenter: presenterSpy, worker: workerFailSpy)

        sut.retrieveAccount()

        //presenter
        XCTAssertFalse(presenterSpy.presentAccountCalled)
        XCTAssertNil(presenterSpy.presentAccount)

        //worker
        XCTAssertFalse(workerFailSpy.workerFetchStatementsCalled)
    }


}

final class HomePresenterSpy: HomePresentationLogic {
    var presentStatementsCalled = false
    var presentStatementsSuccess = false
    var presentStatementsErrorMessage : String?
    var presentStatements = [StatementsModel]()

    var presentAccountCalled = false
    var presentAccount: UserAccountModel?

    func presentStatements(response: Home.GetStatements.Response) {
        presentStatementsCalled = true
        presentStatementsErrorMessage = response.errorMessage
        presentStatementsSuccess = response.success
        presentStatements = response.statements
    }

    func presentAccount(response: Home.GetAccount.Response) {
        presentAccountCalled = true
        presentAccount = response.userAccount
    }
}

final class HomeWorkerSpy: HomeWorkerLogic {
    var workerFetchStatementsCalled = false
    func fetchStatements(completion: @escaping (Result<[StatementsModel], StatementsFailure>) -> Void) {
        workerFetchStatementsCalled = true
        completion(.success(Seeds.Statements.statements))
    }
}

final class HomeWorkerFailSpy: HomeWorkerLogic {
    var workerFetchStatementsCalled = false
    func fetchStatements(completion: @escaping (Result<[StatementsModel], StatementsFailure>) -> Void) {
        workerFetchStatementsCalled = true
        completion(.failure(.network(.init())))
    }
}
