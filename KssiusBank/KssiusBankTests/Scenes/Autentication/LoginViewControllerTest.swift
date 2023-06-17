//
//  LoginViewControllerTest.swift
//  KssiusBankTests
//
//  Created by Cassio Sousa on 16/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

import XCTest

import UIKit

// MARK: - Test Doubles

final class LoginInteractorSpy: LoginBusinessLogic, LoginDataStore {
    var fetchUserCalled = false
    var loginCalled = false

    var userAccount: UserAccountModel?

    func fetchUser(request: Login.FetchUser.Request) {
        fetchUserCalled = true
    }

    func login(request: Login.Login.Request) {
        loginCalled = true
    }
}

// MARK: - Tests

final class LoginViewControllerTests: XCTestCase {

    // MARK: - Verify fetch user on viewDidLoad

    func testFetchUserCalledWhenViewDidLoad() {

        let interactorSpy = LoginInteractorSpy()

        let viewController = LoginViewController()
        viewController.interactor = interactorSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()


        viewController.viewDidLoad()


        XCTAssertTrue(interactorSpy.fetchUserCalled)
    }

    func testDisplayUser() {

        let viewController = LoginViewController()

        let textFieldSpy = TextFieldSpy()
        viewController.userTextField = textFieldSpy

        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()

        let viewModel = Login.FetchUser.ViewModel(user: "test@hotmail.com")


        viewController.displayUser(viewModel: viewModel)


        XCTAssertEqual(viewController.userTextField?.text, "test@hotmail.com")
    }
}
