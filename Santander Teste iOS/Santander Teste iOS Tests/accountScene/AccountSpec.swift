//
//  AccountSpec.swift
//  Santander Teste iOS Tests
//
//  Created by Lucas Ferraciolli Assis on 18/06/19.
//  Copyright © 2019 Lucas Conte. All rights reserved.
//

import Quick
import Nimble

@testable import Santander_Teste_iOS

class AccountSpec: QuickSpec {
    override func spec() {
        describe("Testing Account Scene") {
            var viewController: AccountViewController!
            var presenter: AccountPresenter!
            var interactor: AccountInteractor!
            var router: AccountRouter!
            var worker: AccountWorker!
            
            beforeEach {
                viewController = AccountViewController()
                presenter = AccountPresenter()
                interactor = AccountInteractor()
                router = AccountRouter()
                worker = AccountWorker()
                viewController.interactor = interactor
                viewController.router = router
                interactor.presenter = presenter
                interactor.worker = worker
                presenter.viewController = viewController
                router.viewController = viewController
            }
            
            context("VIP setup", {
                it("View Controller is not null", closure: {
                    expect(viewController).notTo(beNil())
                    expect(presenter.viewController).notTo(beNil())
                    expect(router.viewController).notTo(beNil())
                })
                
                it("Interactor is not null", closure: {
                    expect(viewController.interactor).notTo(beNil())
                    expect(interactor).notTo(beNil())
                })
                
                it("Presenter is not null", closure: {
                    expect(interactor.presenter).notTo(beNil())
                    expect(presenter).notTo(beNil())
                })
                
                it("Router is not null", closure: {
                    expect(router).notTo(beNil())
                    expect(viewController.router).notTo(beNil())
                })
                
                it("Worker is not null", closure: {
                    expect(worker).notTo(beNil())
                    expect(interactor.worker).notTo(beNil())
                })
            })
            
            context("", closure: {
                
            })
        }
    }
}
