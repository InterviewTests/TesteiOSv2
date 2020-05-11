//
//  ShowUserPresenterTest.swift
//  TesteSantaderTests
//
//  Created by Bruno Chen on 10/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import TesteSantader
import Foundation

class ShowUserPresenterTest: XCTestCase {

    var showUserPresenter: ShowUserPresenter! = nil
        
    override func setUp() {
            
        showUserPresenter = ShowUserPresenter()
    }
        
    func testShowUserPresenterUserOutputCalledViewController() {
            
        //Given
        let showUserPresenterOutputSpy = ShowUserPresenterOutputSpy()
        showUserPresenter.viewController = showUserPresenterOutputSpy
            
        //When
        showUserPresenter.presentUser(response: ShowUser.ShowGreeting.Response(userData: UserData(userAccount: UserAccount(userID: 10, name: "", bankAccount: "", agency: "", balance: 1.0), error: ErrorUserAPI())))
            
        //Then
            
        XCTAssertTrue(showUserPresenterOutputSpy.displayLoginFormCalled)
    }
        
    func testShowUserPresenterStatementListOutputCalledViewController() {
            
        //Given
        let showUserPresenterOutputSpy = ShowUserPresenterOutputSpy()
        showUserPresenter.viewController = showUserPresenterOutputSpy
            
        //When
        showUserPresenter.presentStatementList(response: ShowUser.ShowStatementList.Response(statementList: [StatementList(title: "", desc: "", date: "", value: 1.0)]))
            
        //Then
            
        XCTAssertTrue(showUserPresenterOutputSpy.displayLoginFormCalled)
    }
    
    func testShowUserGreetingPresenterOutputViewModelData() {

        //Given
        let showUserPresenterOutputSpy = ShowUserPresenterOutputSpy()
        showUserPresenter.viewController = showUserPresenterOutputSpy

        //When
        
        let userData = ShowUser.ShowGreeting.ViewModel(name: "", bankAgency: "", account: "", balance: "")
        
        showUserPresenter.presentUser(response: ShowUser.ShowGreeting.Response(userData: UserData(userAccount: UserAccount(userID: 10, name: "", bankAccount: "", agency: "", balance: 1.0), error: ErrorUserAPI())))
        

        //Then

        XCTAssertEqual(showUserPresenterOutputSpy.showGreetingViewModelData, userData)
    }
    
    func testShowUserStatementListPresenterOutputViewModelData() {

        //Given
        let showUserPresenterOutputSpy = ShowUserPresenterOutputSpy()
        showUserPresenter.viewController = showUserPresenterOutputSpy

        //When
        
        let responseShowStatementList = ShowUser.ShowStatementList.Response(statementList: [StatementList(title: "title", desc: "desc", date: "date", value: 1.0)])
        let viewModelShowStatementList = ShowUser.ShowStatementList.ViewModel(displayedStatement: [ShowUser.ShowStatementList.ViewModel.DisplayedStatement(title: "title", desc: "desc", date: "date", value: 1.0)])
        
        
        showUserPresenter.presentStatementList(response: responseShowStatementList)
        

        //Then

        XCTAssertEqual(showUserPresenterOutputSpy.showStatementViewModelData, viewModelShowStatementList)
    }
        
        
}



// MARK: - LoginForm Presenter Output Spy

class  ShowUserPresenterOutputSpy: ShowUserDisplayLogic {
    
    
    var displayLoginFormCalled = false
    
    var showGreetingViewModelData: ShowUser.ShowGreeting.ViewModel!
    var showStatementViewModelData: ShowUser.ShowStatementList.ViewModel!
    
    func displayShowGreeting(viewModel: ShowUser.ShowGreeting.ViewModel) {
        displayLoginFormCalled = true
        
        showGreetingViewModelData = viewModel
    }
    
    func displayStatement(viewModel: ShowUser.ShowStatementList.ViewModel) {
        displayLoginFormCalled = true
        
        showStatementViewModelData = viewModel
    }
    
    func getUser() {
        displayLoginFormCalled = true
    }
    
    func fetchStatement() {
        displayLoginFormCalled = true
    }
        
}

