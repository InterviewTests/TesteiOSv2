//
//  LoginPresenterTests.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 28/05/19.
//  Copyright (c) 2019 Marlon Santos Heitor. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TesteiOSv2Acc
import XCTest

class LoginPresenterTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: LoginPresenter!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupLoginPresenter()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupLoginPresenter()
    {
        sut = LoginPresenter()
    }
    
    // MARK: Test doubles
    
    class LoginDisplayLogicSpy: LoginDisplayLogic
    {
        var displayedViewModel: Login.LoadLoginData.ViewModel? = nil
        var displaySavedLoginDataCalled = false
        func displaySavedLoginData(viewModel: Login.LoadLoginData.ViewModel) {
            displaySavedLoginDataCalled = true
            displayedViewModel = viewModel
        }
        
        var displayLoggedInUserViewModel: Login.LoginUser.ViewModel? = nil
        var displayLoggedInUserCalled = false
        func displayLoggedInUser(viewModel: Login.LoginUser.ViewModel) {
            displayLoggedInUserCalled = true
            displayLoggedInUserViewModel = viewModel
        }
    }
    
    // MARK: Tests
    
    func testPresentLoadLoginData()
    {
        // Given
        let spy = LoginDisplayLogicSpy()
        sut.viewController = spy
        let response = Login.LoadLoginData.Response(user: "T2", isError: false)
        
        // When
        sut.presentLoadLoginData(response: response)
        
        // Then
        XCTAssertTrue(spy.displaySavedLoginDataCalled)
        XCTAssertEqual(spy.displayedViewModel?.user!, "T2")
        XCTAssertEqual(spy.displayedViewModel?.errorMessage, nil)
    }
    
    func testPresentUserLoggedIn()
    {
        // Given
        let spy = LoginDisplayLogicSpy()
        sut.viewController = spy
        let userAccount = UserAccount(userId: 10, name: "T3", bankAccount: "2222", agency: "12345678", balance: 20)
        let response = Login.LoginUser.Response(userAccount: userAccount, serviceError: nil)
        
        // When
        sut.presentLoginUser(response: response)
        
        // Then
        XCTAssertTrue(spy.displayLoggedInUserCalled)
        XCTAssertEqual(spy.displayLoggedInUserViewModel?.serviceError?.code, nil)
        XCTAssertEqual(spy.displayLoggedInUserViewModel?.userAccount?.name, "T3")
    }
    
}
