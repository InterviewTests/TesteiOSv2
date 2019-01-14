//
//  LoginInteractorSpec.swift
//  TesteiOSv2Tests
//
//  Created by Brendoon Ryos on 14/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Nimble
import Quick

@testable import TesteiOSv2

class LoginInteractorSpec: QuickSpec {
  override func spec() {
    describe("a Login Interactor") {
      var interactor: LoginInteractor!
      
      beforeEach {
        interactor = LoginInteractor()
      }
      it("should validate login rules") {
        expect(interactor.checkLoginRules(userName: "abc@com.br", password: "Abc@10")).to(beNil())
        expect(interactor.checkLoginRules(userName: "06668090389", password: "Def$20")).to(beNil())
        expect(interactor.checkLoginRules(userName: "06668090387", password: "Def$20")?.description.title).to(be(LoginError.invalidUsername.description.title))
        expect(interactor.checkLoginRules(userName: "0666809", password: "Def$20")?.description.title).to(be(LoginError.invalidUsername.description.title))
        expect(interactor.checkLoginRules(userName: "0666809ab", password: "Def$20")?.description.title).to(be(LoginError.invalidUsername.description.title))
        expect(interactor.checkLoginRules(userName: "abc@com", password: "Def$20")?.description.title).to(be(LoginError.invalidUsername.description.title))
        expect(interactor.checkLoginRules(userName: "abc@", password: "Def$20")?.description.title).to(be(LoginError.invalidUsername.description.title))
        expect(interactor.checkLoginRules(userName: "abc", password: "Def$20")?.description.title).to(be(LoginError.invalidUsername.description.title))
        expect(interactor.checkLoginRules(userName: "abc10", password: "Def$20")?.description.title).to(be(LoginError.invalidUsername.description.title))
        expect(interactor.checkLoginRules(userName: "abc.com", password: "Def$20")?.description.title).to(be(LoginError.invalidUsername.description.title))
        expect(interactor.checkLoginRules(userName: "@.com", password: "Def$20")?.description.title).to(be(LoginError.invalidUsername.description.title))
        expect(interactor.checkLoginRules(userName: "abc@com.br", password: "abc")?.description.title).to(be(LoginError.invalidPassword.description.title))
        expect(interactor.checkLoginRules(userName: "abc@com.br", password: "Abc")?.description.title).to(be(LoginError.invalidPassword.description.title))
        expect(interactor.checkLoginRules(userName: "abc@com.br", password: "Abc@")?.description.title).to(be(LoginError.invalidPassword.description.title))
        expect(interactor.checkLoginRules(userName: "abc@com.br", password: "Abc10")?.description.title).to(be(LoginError.invalidPassword.description.title))
      }
    }
  }
}
