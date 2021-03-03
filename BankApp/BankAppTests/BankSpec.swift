//
//  BankSpec.swift
//  BankAppTests
//
//  Created by Adriano Rodrigues Vieira on 02/03/21.
//

import Alamofire
import Nimble
import Quick
@testable import BankApp // Tenho que importar toda a pasta do projeto...

class BankSpec: QuickSpec {
    override func spec() {
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
                
                request.responseDecodable(of: UserLoginData.self) { response in
                    if let userLogin = response.value {
                        if let errorCode = userLogin.error?.code {
                            let error = ErrorMessage(from: userLogin.error!)
                            
                            print(error.message)
                        } else if let userAccountName = userLogin.userAccount?.name {
                            let userAccount = UserAccount(from: userLogin.userAccount!)
                            
                            expect(userAccount.name).to(equal(LOGIN_EXAMPLE.NAME))
                        }
                    }
                }
            }
        }        
    }
}
