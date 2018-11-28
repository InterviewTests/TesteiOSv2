//
//  LoginViewControllerTest.swift
//  TesteSantanderTests
//
//  Created by Henrique Pereira de Lima on 28/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import TesteSantander

class LoginViewControllerTest: QuickSpec {

    var controller : LoginViewController!
    
    override func spec() {
        describe("LoginViewController test") {
            beforeEach {
                self.controller = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController)
                _ = self.controller.view
            }
            
            context("When view is loaded") {
                it("should lblMessageError Hidden True"){
                    expect(self.controller.lblMessageError.isHidden).to(beTrue())
                }
                
                it("should not have interactor nil") {
                    expect(self.controller.interactor).toNot(beNil())
                }
                
                it("should not have router nil") {
                    expect(self.controller.router).toNot(beNil())
                }
                
                it("should not have presenter nil") {
                    expect(self.controller.interactor?.presenter).toNot(beNil())
                }
                
                it("should not have worker nil") {
                    expect(self.controller.interactor?.worker).toNot(beNil())
                }
                
                it("loginTextField should have autoChangeFormat with true") {
                    expect(self.controller.txfLogin.autoChangeFormat).to(beTrue())
                }
            }
            
            context("When try to logon withOut data"){
                it("lblMessage error should is hidden true e withOut text") {
                    self.controller.txfLogin.text = "h.h@gmail.com"
                    self.controller.txfPassword.text = "Teste@1"
                    self.controller.doLogin(self.controller.btnLogin)
                    expect(self.controller.lblMessageError.text).to(equal(""))
                    expect(self.controller.lblMessageError.isHidden).to(beTrue())
                }
                it("lblMessage error should is hidden false e with the textError") {
                    let textError = GeneralError.emptyFields.localizedDescription
                    self.controller.doLogin(self.controller.btnLogin)
                    expect(self.controller.lblMessageError.isHidden).to(beFalse())
                    expect(self.controller.lblMessageError.text).to(equal(textError))
                }
            }
            
            context("When try to logon with error data"){
                it("lblMessage error should is message correct for invalid username") {
                    self.controller.txfLogin.text = "h.h@gmailcom"
                    self.controller.txfPassword.text = "Teste@1"
                    let textError = GeneralError.invalidUsername.localizedDescription
                    self.controller.doLogin(self.controller.btnLogin)
                    expect(self.controller.lblMessageError.text).to(equal(textError))
                }
                it("lblMessage error should is message correct for invalid password") {
                    self.controller.txfLogin.text = "h.h@gmail.com"
                    self.controller.txfPassword.text = "teste@1"
                    let textError = GeneralError.invalidPassword.localizedDescription
                    self.controller.doLogin(self.controller.btnLogin)
                    expect(self.controller.lblMessageError.text).to(equal(textError))
                }
            }
        }
    }
    
}
