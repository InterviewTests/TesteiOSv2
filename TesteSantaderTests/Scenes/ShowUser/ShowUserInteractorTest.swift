//
//  ShowUserInteractor.swift
//  TesteSantaderTests
//
//  Created by Bruno Chen on 10/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import XCTest
@testable import TesteSantader
import Foundation

class ShowUserInteractorTest: XCTestCase {
    
        override func setUp() {
            super.setUp()
        }
        
        override class func tearDown() {
            super.tearDown()
        }
        
        // MARK: - Test setup
        
        func testSetupShowUserInteractor() {
            _ = ShowUserInteractor()
        }

        // MARK: - Test login
        
        func testShowUserBusinessLogicGetOutputOfStoryboard() {
            let showUserInteractor = ShowUserInteractor()
            let bankApiWorker = ShowUserBankAPIWorkerMock()
            
            //Given
            showUserInteractor.bankApiWorker = bankApiWorker
            let showUserInteractorOutputSpy = ShowUserInteractorOutputSpy()
            showUserInteractor.presenter = showUserInteractorOutputSpy
           
            showUserInteractor.user = UserData(userAccount: UserAccount(userID: 1, name: "", bankAccount: "", agency: "", balance: 1.0), error: ErrorUserAPI())
            
            let userRequest = ShowUser.ShowGreeting.Request()
            let requestStatementList = ShowUser.ShowStatementList.Request(userID: "userID")
            
            //When
            showUserInteractor.showGreeting(request: userRequest)
            showUserInteractor.getStatementList(request: requestStatementList)
            
            //Then
            
            XCTAssertTrue(showUserInteractorOutputSpy.presentUserCalled, "Verify if present is called")
            XCTAssertTrue(showUserInteractorOutputSpy.presentStatementList, "Verify if present is called")
        }
        
        // MARK: - Test user if stored
        
        func testStatementListReturnAllUserInformationToPresender() {
            let showUserInteractor = ShowUserInteractor()
            let bankApiWorker = ShowUserBankAPIWorkerMock()
            
            //Given
            let showUserInteractorOutputSpy = ShowUserInteractorOutputSpy()
            showUserInteractor.presenter = showUserInteractorOutputSpy
            showUserInteractor.bankApiWorker = bankApiWorker
            
            let response = ShowUser.ShowStatementList.Response(statementList: [StatementList(title: "title", desc: "desc", date: "date", value: 1.0)])
            
            //When
            showUserInteractor.getStatementList(request: ShowUser.ShowStatementList.Request(userID: "userID"))
            
            //Then
            XCTAssertEqual(response, showUserInteractorOutputSpy.statementListRespodnse, "Statement List must be full")
        }
        
    }

    // MARK: - Presenter Mock

    class ShowUserInteractorOutputSpy: ShowUserPresentationLogic {
        var presentUserCalled = false
        var presentStatementList = false
        
        var statementListRespodnse: ShowUser.ShowStatementList.Response?
        
        func presentUser(response: ShowUser.ShowGreeting.Response) {
            presentUserCalled = true
        }
        
        func presentStatementList(response: ShowUser.ShowStatementList.Response) {
            presentStatementList = true
            statementListRespodnse = response
        }
    }

    // MARK: - Bank API Worker Mock

    class ShowUserBankAPIWorkerMock: BankAPIWorkerProtocol {
        
        func fetchUser(userID: String, password: String, completionHandler: @escaping (UserData?) -> Void) {
            let allUserData: UserData = UserData(userAccount: UserAccount(userID: 10, name: "name", bankAccount: "bankAccount", agency: "agency", balance: 1.0), error: ErrorUserAPI())
            completionHandler(allUserData)
        }
        
        func fetchStatementList(userID: String, completionHandler: @escaping ([StatementList]) -> Void) {
            let response = [StatementList(title: "title", desc: "desc", date: "date", value: 1.0)]
            completionHandler(response)

        }
        
        
    }
