//
//  LoginPresenterTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import XCTest
@testable import KssiusBank

final class LoginPresenterTest: XCTestCase {


    // MARK: - Presenter resolve login success

    func testSuccessDisplayUser() {

        let viewControllerSpy = LoginViewControllerSpy()

        let sut = LoginPresenter()
        sut.viewController = viewControllerSpy

        let response = Login.FetchUser.Response(user: "test@hotmail.com")


        sut.displayUser(response: response)

        XCTAssertTrue(viewControllerSpy.displayUserCalled)
        XCTAssertEqual(viewControllerSpy.displayUserViewModel.user, "test@hotmail.com")
    }

    // MARK: - Presenter resolve login success

    func testSuccessResolveLogin() {

        let viewControllerSpy = LoginViewControllerSpy()

        let sut = LoginPresenter()
        sut.viewController = viewControllerSpy

        let response = Login.Login.Response(success: true, errorMessage: nil)


        sut.resolveLogin(response: response)

        XCTAssertTrue(viewControllerSpy.resolveLoginCalled)
        XCTAssertTrue(viewControllerSpy.resolveLoginViewModel.success)
        XCTAssertNil(viewControllerSpy.resolveLoginViewModel.errorMessage)
    }

    // MARK: - Presenter resolve login failure

    func testFailureResolveLogin() {

        let viewControllerSpy = LoginViewControllerSpy()

        let sut = LoginPresenter()
        sut.viewController = viewControllerSpy

        let response = Login.Login.Response(success: false, errorMessage: L10n.User.Authentication.Error.invalidCpf)


        sut.resolveLogin(response: response)


        XCTAssertTrue(viewControllerSpy.resolveLoginCalled)
        XCTAssertFalse(viewControllerSpy.resolveLoginViewModel.success)
        XCTAssertEqual(viewControllerSpy.resolveLoginViewModel.errorMessage, L10n.User.Authentication.Error.invalidCpf)
    }
}

final class LoginViewControllerSpy : LoginDisplayLogic {
    var resolveLoginCalled = false
    var resolveLoginViewModel: Login.Login.ViewModel = .init()

    var displayUserCalled = false
    var displayUserViewModel: Login.FetchUser.ViewModel = .init()

    func displayUser(viewModel: Login.FetchUser.ViewModel) {
        displayUserCalled = true
        displayUserViewModel = viewModel
    }

    func resolveLogin(viewModel: Login.Login.ViewModel) {
        resolveLoginCalled = true
        resolveLoginViewModel = viewModel
    }



}
