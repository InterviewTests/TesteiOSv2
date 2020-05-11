//
//  LoginFormViewControllerTest.swift
//  TesteSantaderTests
//
//  Created by Bruno Chen on 10/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import TesteSantader
import Foundation

class ShowUserViewControllerTest: XCTestCase {

    var showUserViewController: ShowUserViewController!
    var interactorMock: ShowUserInteractorsMock!
    
    override func setUp() {
        interactorMock = ShowUserInteractorsMock()
         
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        showUserViewController =  storyboard.instantiateViewController(identifier: "ShowUserViewController")
        showUserViewController.interactor = interactorMock
        showUserViewController.loadViewIfNeeded()
        showUserViewController.viewDidLoad()
    }
    
    func testDisplayShowUserShoudDisplayViews() {
        
        //Given
        let viewModel = ShowUser.ShowGreeting.ViewModel(name: "name", bankAgency: "bankAgency", account: "account", balance: "balance")
        //When
        showUserViewController.displayShowGreeting(viewModel: viewModel)

        //Then
        XCTAssertEqual(showUserViewController.nameLabel.text, "name")
        XCTAssertEqual(showUserViewController.balanceLabel.text, "balance")
        
    }

    func testDisplayLoginFormCallLoadViewFuncions() {

        //Given


        //When
        showUserViewController.loadViewIfNeeded()
        showUserViewController.viewDidLoad()

        //Then
        XCTAssertTrue(interactorMock.calledFetchStatement)
        XCTAssertTrue(interactorMock.calledGetUser)
    }

}


// MARK: - LoginForm Interactor Mock

class ShowUserInteractorsMock: ShowUserBusinessLogic {
    
    var calledFetchStatement = false
    var calledGetUser = false
    
    func showGreeting(request: ShowUser.ShowGreeting.Request) {
        calledGetUser = true
    }
    
    func getStatementList(request: ShowUser.ShowStatementList.Request) {
        calledFetchStatement = true
    }
    
    func logoutUser() {

    }
}
