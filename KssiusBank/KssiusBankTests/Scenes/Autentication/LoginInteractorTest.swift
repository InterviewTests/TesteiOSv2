//
//  LoginInteractor.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import XCTest
@testable import KssiusBank

final class LoginInteractorTest: XCTestCase {

    // MARK: - Tests Error worker network

    func testFailureLoginWithNetwork() {
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerFailSpy(failure: .network(.init()))
        let userWorkerSpy = UserWorkerSuccessSpy()

        let sut = LoginInteractor(
            presenter: presenterSpy,
            worker: workerSpy,
            userWork: userWorkerSpy
        )

        let request = Login.Login.Request(user: Seeds.email, password: Seeds.password)


        sut.login(request: request)

        XCTAssertTrue(workerSpy.loginCalled)
        XCTAssertFalse(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertFalse(presenterSpy.presentedLoginSuccess)
        XCTAssertEqual(
            presenterSpy.presentedLoginErrorMessage,
            L10n.Network.Error.general
        )
    }

    // MARK: - Tests Success fetch user
    func testSuccessFetchUser() {


        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerSuccessSpy()
        let userWorkerSpy = UserWorkerSuccessSpy()

        let sut = LoginInteractor(
            presenter: presenterSpy,
            worker: workerSpy,
            userWork: userWorkerSpy
        )

        let request = Login.Login.Request(user: Seeds.email, password: Seeds.password)

        sut.login(request: request)
        sut.fetchUser(request: .init())

        let expectedUser = Seeds.email
        XCTAssertTrue(userWorkerSpy.retrieveUserCalled)
        XCTAssertTrue(presenterSpy.presentUserCalled)
        XCTAssertEqual(presenterSpy.displayedUser, expectedUser)
    }


}

// MARK: - Tests Invalid login

extension LoginInteractorTest {

    // MARK: - LoginSeuccess with email

    func testSuccessLoginWithEmail() {

        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerSuccessSpy()
        let userWorkerSpy = UserWorkerSuccessSpy()

        let sut = LoginInteractor(
            presenter: presenterSpy,
            worker: workerSpy,
            userWork: userWorkerSpy
        )

        let request = Login.Login.Request(user: Seeds.email, password: Seeds.password)

        sut.login(request: request)


        XCTAssertTrue(workerSpy.loginCalled)
        XCTAssertTrue(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertTrue(presenterSpy.presentedLoginSuccess)
        XCTAssertNil(presenterSpy.presentedLoginErrorMessage)
    }

    // MARK: - Login Success with cpf

    func testSuccessLoginWithCPF() {
        
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerSuccessSpy()
        let userWorkerSpy = UserWorkerSuccessSpy()

        let sut = LoginInteractor(
            presenter: presenterSpy,
            worker: workerSpy,
            userWork: userWorkerSpy
        )

        let request = Login.Login.Request(user: Seeds.cpf, password: Seeds.password)

        sut.login(request: request)


        XCTAssertTrue(workerSpy.loginCalled)
        XCTAssertTrue(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertTrue(presenterSpy.presentedLoginSuccess)
        XCTAssertNil(presenterSpy.presentedLoginErrorMessage)
    }

    // MARK: - Login Failure with cpf

    func testFailureLoginWithoutUserAndPassword() {
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerSuccessSpy()
        let userWorkerSpy = UserWorkerSuccessSpy()

        let sut = LoginInteractor(
            presenter: presenterSpy,
            worker: workerSpy,
            userWork: userWorkerSpy
        )

        let request = Login.Login.Request(user: nil, password: nil)

        // WHEN
        sut.login(request: request)

        // THEN
        XCTAssertFalse(workerSpy.loginCalled)
        XCTAssertFalse(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertFalse(presenterSpy.presentedLoginSuccess)
        XCTAssertEqual(
            presenterSpy.presentedLoginErrorMessage,
            L10n.User.Authentication.Error.general
        )
    }


    // MARK: - Login Failure login with invalid email

    func testFailureLoginWithInvalidEmail() {
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerFailSpy(failure: .user)
        let userWorkerSpy = UserWorkerSuccessSpy()

        let sut = LoginInteractor(
            presenter: presenterSpy,
            worker: workerSpy,
            userWork: userWorkerSpy
        )

        let request = Login.Login.Request(user: "test@com", password: Seeds.password)


        sut.login(request: request)

        XCTAssertTrue(workerSpy.loginCalled)
        XCTAssertFalse(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertFalse(presenterSpy.presentedLoginSuccess)
        XCTAssertEqual(
            presenterSpy.presentedLoginErrorMessage,
            L10n.User.Authentication.Error.invalidCpf
        )
    }

    // MARK: - Login Failure login with invalid cpf

    func testFailureLoginWithInvalidCPF() {
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerFailSpy(failure: .user)
        let userWorkerSpy = UserWorkerSuccessSpy()

        let sut = LoginInteractor(
            presenter: presenterSpy,
            worker: workerSpy,
            userWork: userWorkerSpy
        )

        let request = Login.Login.Request(user: "1231", password: Seeds.password)


        sut.login(request: request)

        XCTAssertTrue(workerSpy.loginCalled)
        XCTAssertFalse(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertFalse(presenterSpy.presentedLoginSuccess)
        XCTAssertEqual(
            presenterSpy.presentedLoginErrorMessage,
            L10n.User.Authentication.Error.invalidCpf
        )
    }


    // MARK: - Login Failure login with invalid password

    func testFailureLoginWithInvalidPassword() {
        let presenterSpy = LoginPresenterSpy()
        let workerSpy = LoginWorkerFailSpy(failure: .password)
        let userWorkerSpy = UserWorkerSuccessSpy()

        let sut = LoginInteractor(
            presenter: presenterSpy,
            worker: workerSpy,
            userWork: userWorkerSpy
        )

        let request = Login.Login.Request(user:Seeds.cpf, password: "abc" )

        sut.login(request: request)

        XCTAssertTrue(workerSpy.loginCalled)
        XCTAssertFalse(userWorkerSpy.saveUserCalled)
        XCTAssertTrue(presenterSpy.presentLoginCalled)
        XCTAssertFalse(presenterSpy.presentedLoginSuccess)
        XCTAssertEqual(
            presenterSpy.presentedLoginErrorMessage,
            L10n.User.Authentication.Error.invalidPassword
        )
    }
}


final class LoginPresenterSpy: LoginPresentationLogic {

    var presentUserCalled = false
    var presentLoginCalled = false

    var displayedUser: String?

    var presentedLoginSuccess = false
    var presentedLoginErrorMessage: String?

    func displayUser(response: Login.FetchUser.Response) {
        presentUserCalled = true
        displayedUser = response.user
    }

    func resolveLogin(response: Login.Login.Response) {
        presentLoginCalled = true
        presentedLoginSuccess = response.success
        presentedLoginErrorMessage = response.errorMessage
    }
}

final class LoginWorkerSuccessSpy: LoginWorkerLogic {
    var loginCalled = false

    func login(username: String, password: String, completion: @escaping (Result<UserAccountModel, UserFailure>) -> Void) {
        loginCalled = true
        completion(.success(Seeds.user))
    }
}

final class LoginWorkerFailSpy: LoginWorkerLogic {
    var loginCalled = false
    let failure: UserFailure

    init(failure: UserFailure) {
        self.failure = failure
    }

    func login(username: String, password: String, completion: @escaping (Result<UserAccountModel, UserFailure>) -> Void) {
        loginCalled = true
        completion(.failure(failure))
    }
}

final class UserWorkerSuccessSpy: UserWorkerLogic {
    var saveUserCalled = false
    var retrieveUserCalled = false
    func save(user: UserAccountModel) -> UserAccountModel? {
        saveUserCalled = true
        return Seeds.user
    }

    func retrieveUser() -> UserAccountModel? {
        retrieveUserCalled = true
        return Seeds.user
    }
}
