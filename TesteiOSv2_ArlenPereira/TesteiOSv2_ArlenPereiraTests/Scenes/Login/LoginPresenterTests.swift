//
//  LoginPresenterTests.swift
//  TesteiOSv2_ArlenPereiraTests
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

@testable import TesteiOSv2_ArlenPereira
import XCTest
import SwiftyJSON

class LoginPresenterTests: XCTestCase {
    
    // MARK: - Subject under test
    var sut: LoginPresenter!
    
    override func setUp() {
        setupLoginPresenter()
    }

    override func tearDown() { }
    
    // MARK: - Test setup
    func setupLoginPresenter() {
        sut = LoginPresenter()
    }
    
    func loginUserAccountMock() -> [LoginAPIRequest]? {
        
        let loginUserAccount = LoginAPIUserAccount(json: JSON(dictionaryLiteral: ("userId", 1), ("name", "Jose da Silva Teste"), ("bankAccount", "2050"), ("agency", "01234564"), ("balance", 3.3445)))
        
        let loginError = ""
        
        let login = LoginAPIRequest(json: JSON(dictionaryLiteral: ("userAccount", loginUserAccount), ("error", loginError)))
        
        return [login]
    }
    
    func loginErrorMock() -> [LoginAPIRequest]? {
        
        let loginUserAccount = ""
        
        let loginError = LoginAPIError(json: JSON(dictionaryLiteral: ("code", 53), ("message", "Usuário ou senha incorreta")))
        
        let login = LoginAPIRequest(json: JSON(dictionaryLiteral: ("userAccount", loginUserAccount), ("error", loginError)))
        
        return [login]
    }
    
    class LoginDisplayLogicSpy: LoginDisplayLogic {
        
        // MARK: Method call expectations
        var displayLoginIsCalled_userId = false
        var displayLoginIsCalled_name = false
        var displayLoginIsCalled_bankAccount = false
        var displayLoginIsCalled_agency = false
        var displayLoginIsCalled_balance = false
        
        var displayLoginIsCalled_code = false
        var displayLoginIsCalled_message = false
        
        var viewLogin: LoginModel.LoginRequestModel.ViewModel!
        
        func displayLogin(viewModel: LoginModel.LoginRequestModel.ViewModel) {
            viewLogin = viewModel
            for item in viewModel.data {
                if item.userId != nil {
                    displayLoginIsCalled_userId = true
                }
                
                if item.name != nil {
                    displayLoginIsCalled_name = true
                }
                
                if item.bankAccount != nil {
                    displayLoginIsCalled_bankAccount = true
                }
                
                if item.agency != nil {
                    displayLoginIsCalled_agency = true
                }
                
                if item.balance != nil {
                    displayLoginIsCalled_balance = true
                }
                
                if item.code != nil {
                    displayLoginIsCalled_code = true
                }
                
                if item.message != nil {
                    displayLoginIsCalled_message = true
                }
            }
        }
    }

    // MARK: Tests
    func testPresentLogin_with_validInput_shouldCall_isValid_displayLoginData() {
        // Given
        let spy = LoginDisplayLogicSpy()
        sut.viewController = spy
        let loginAPIResponse = LoginAPIModel(data: loginUserAccountMock(), message: "", code: "")
        let response = LoginModel.LoginRequestModel.Response(loginResponse: loginAPIResponse)
        
        // When
        sut.presentLogin(response: response)
        
        // Then
        XCTAssertTrue(spy.displayLoginIsCalled_userId, "When the valid input is passed to presenter \nThen userId from displayLoginData should be called")
    }
}
