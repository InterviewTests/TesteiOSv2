//
//  LoginInteractorTest.swift
//  TesteSantanderTests
//
//  Created by Henrique Pereira de Lima on 28/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit
import Quick
import Nimble

@testable import TesteSantander

class LoginInteractorTest: QuickSpec {

    var interactor = LoginInteractor()
    
    override func spec() {
        describe("LoginInteractor Test") {
            context("Validation password") {
                it("should to be true") {
                    let correctPassword = "Teste@1"
                    expect(self.interactor.isValidPassword(correctPassword)).to(beTrue())
                }
                
                it("should to be false") {
                    let errorPassword = "Teste1"
                    expect(self.interactor.isValidPassword(errorPassword)).to(beFalse())
                }
                
            }
            
            context("Validation username") {
                it("should to be true") {
                    let correctEmail = "h.h@gmail.com"
                    expect(self.interactor.isValidUsername(correctEmail)).to(beTrue())
                    let correctCPF = "123.456.789-09"
                    expect(self.interactor.isValidUsername(correctCPF)).to(beTrue())
                }
                
                it("should to be false") {
                    let errortEmail = "h.h@gmailcom"
                    expect(self.interactor.isValidUsername(errortEmail)).to(beFalse())
                    let errorCPF = "153.476.709-09"
                    expect(self.interactor.isValidUsername(errorCPF)).to(beFalse())
                }
                
            }
            
        }
    }
}
