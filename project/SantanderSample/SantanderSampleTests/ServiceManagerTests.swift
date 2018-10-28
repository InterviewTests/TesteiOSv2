//
//  SantanderSampleTests.swift
//  SantanderSampleTests
//
//  Created by Virgilius Santos on 28/10/18.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import Quick
import Nimble
import Swinject

@testable import SantanderSample

class ServiceManagerTests: QuickSpec {
    struct APIRequestLoginMock: APIRequestLogin {
        var user: String? = "teste"
        var password: String? = "teste"
        typealias Response = APIResponseLoginMock
    }
    struct APIResponseLoginMock: APIResponse {
        var userAccount: Login.UserAccount?
        var error: Login.Error?
    }
    
    struct APIRequestDetailMock: APIRequestDetail {
        typealias Response = APIResponseDetailMock
        var userId: Int? = 2
    }
    struct APIResponseDetailMock: APIResponse {
        var statementList = [Detail.Statement]()
        var error: Detail.DetailError?
    }
    
    override func spec() {
        var container: Container!
        beforeEach {
            container = Container()
            container.register(ServiceManager.self) { _ in ServiceManager() }
                .inObjectScope(.container)
            container.register(APIRequestDetailMock.self) { r in
                let rq = APIRequestDetailMock()
                return rq
            }
            container.register(APIRequestLoginMock.self) { r in
                let rq = APIRequestLoginMock()
                return rq
            }
        }
        
        it("verificando se o usuario consegue logar") {
            let request = container.resolve(APIRequestLoginMock.self)!
            let ds = container.resolve(ServiceManager.self)!
            waitUntil(timeout: 10) { done in
                ds.login(request, completion: { (result) in
                    if case .success(let response) = result {
                        expect(response.userAccount?.userId).notTo(beNil())
                        expect(response.error).notTo(beNil())
                        expect(response.error?.code).to(beNil())
                        expect(response.error?.message).to(beNil())
                    }
                    done()
                })
            }
        }
        
        it("verificando se os detalhes sao baixados") {
            let request = container.resolve(APIRequestDetailMock.self)!
            let ds = container.resolve(ServiceManager.self)!
            waitUntil(timeout: 10) { done in
                ds.get(request, completion: { (result) in
                    if case .success(let response) = result {
                        expect(response.statementList).notTo(beEmpty())
                        expect(response.error).notTo(beNil())
                        expect(response.error?.code).to(beNil())
                        expect(response.error?.message).to(beNil())
                    }
                    done()
                })
            }
        }
        
        
    }

}
