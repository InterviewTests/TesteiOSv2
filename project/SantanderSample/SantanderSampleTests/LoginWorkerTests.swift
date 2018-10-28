//
//  LoginWorkerTests.swift
//  SantanderSampleTests
//
//  Created by Virgilius Santos on 28/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Swinject

@testable import SantanderSample

class LogingWorkerTests: QuickSpec {
    override func spec() {
        var container: Container!
        beforeEach {
            container = Container()
            container.register(ServiceManager.self) { _ in ServiceManager() }
                .inObjectScope(.container)
            container.register(LoginWorker.self) { r in
                let rq = LoginWorker()
                rq.serviceManager = r.resolve(ServiceManager.self)
                return rq
            }
            let _ = KeychainManager.remove(type: .user)
            let _ = KeychainManager.remove(type: .password)
        }
        it("validacao de senha") {
            let lw = container.resolve(LoginWorker.self)!
            expect(lw.validatePassword("T@1")).to(beTrue())
            expect(lw.validatePassword("a@T")).to(beTrue())
            expect(lw.validatePassword("fail")).notTo(beTrue())
            expect(lw.validatePassword("Fail")).notTo(beTrue())
            expect(lw.validatePassword("f0ail")).notTo(beTrue())
            expect(lw.validatePassword("fai@l")).notTo(beTrue())
            expect(lw.validatePassword("@l")).notTo(beTrue())
            expect(lw.validatePassword("")).notTo(beTrue())
            expect(lw.validatePassword(nil)).notTo(beTrue())
        }
        it("validacao de id") {
            let lw = container.resolve(LoginWorker.self)!
            expect(lw.validateId("admin@admin.com")).to(beTrue())
            expect(lw.validateId("333.777.666-66")).to(beTrue())
            expect(lw.validateId("33333333339")).to(beTrue())
            expect(lw.validateId("admin@admin.com.ki")).to(beTrue())
            expect(lw.validateId("7777uuuuu")).notTo(beTrue())
            expect(lw.validateId("awewe@l")).notTo(beTrue())
            expect(lw.validateId("@lrrttrert")).notTo(beTrue())
            expect(lw.validateId("")).notTo(beTrue())
            expect(lw.validateId(nil)).notTo(beTrue())
        }
        
        it("integração LoginWorker, Keychain, Service") {
            let lw = container.resolve(LoginWorker.self)!
            let rq = Login.Request(user: "teste", password: "teste")
            waitUntil(timeout: 10) { done in
                lw.login(rq, completion: { (result) in
                    if case .success(let response) = result {
                        expect(response.userAccount?.userId)
                            .notTo(beNil())
                        expect(response.error).notTo(beNil())
                        expect(response.error?.code).to(beNil())
                        expect(response.error?.message).to(beNil())
                        
                        expect(KeychainManager.get(type: .user))
                            .to(equal(rq.user))
                        expect(KeychainManager.get(type: .password))
                            .to(equal(rq.password))
                    }
                    done()
                })
            }
        }
        
        afterSuite {
            let _ = KeychainManager.remove(type: .user)
            let _ = KeychainManager.remove(type: .password)
        }
    }
}
