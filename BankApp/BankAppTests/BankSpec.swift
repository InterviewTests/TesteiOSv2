//
//  BankSpec.swift
//  BankAppTests
//
//  Created by Adriano Rodrigues Vieira on 02/03/21.
//

import Alamofire
import Nimble
import Quick
@testable import BankApp

class BankSpec: QuickSpec {
    override func spec() {
        /// Esta especificação de teste não funciona conforme o esperado, tendo em vista que a API de login sempre permite autenticação independente do
        /// usuario / email passado.

        describe("LOGIN TEST:") {
            it("should log in successfully") {
                let headers: HTTPHeaders = [
                    .contentType("application/json; charset=utf-8")
                ]
                let request = AF.request(URLS.LOGIN_ENDPOINT,
                                         method: .post,
                                         parameters: LOGIN_EXAMPLE.USER_PARAMETERS,
                                         encoder: JSONParameterEncoder.default,
                                         headers: headers)
                waitUntil(timeout: DispatchTimeInterval.seconds(10)) { done in
                    request.responseDecodable(of: UserLoginData.self) { response in
                        if let userLogin = response.value {
                            if (userLogin.error?.code) != nil {
                                let error = ErrorMessage(from: userLogin.error!)
                                
                                print(error.message)
                            } else if (userLogin.userAccount?.name) != nil {
                                let userAccount = UserAccount(from: userLogin.userAccount!)
                                
                                expect(userAccount.name).to(equal(LOGIN_EXAMPLE.NAME))
                                done()
                            }
                        }
                    }
                }
            }
        }        
    }
}
