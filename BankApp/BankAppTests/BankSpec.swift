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
        describe("LOGIN TEST:") {
            it("should log in successfully and print the user's name:") {
                let headers: HTTPHeaders = [
                    .contentType("application/json; charset=utf-8")
                ]
                let request = AF.request(REQUESTS.LOGIN_ENDPOINT,
                                         method: .post,
                                         parameters: TESTING_DATA.USER_PARAMETERS,
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
                                
                                expect(userAccount.name).to(equal(USER_EXAMPLE.NAME))
                                done()
                            }
                        }
                    }
                }
            }
        }
        
        describe("USERNAME PATTERN TEST") {
            context("USERNAME CPF") {
                it("should return TRUE when testing a correct CPF pattern:") {
                    expect(LoginValidation.validateCpf(TESTING_DATA.VALID_CPF)).to(beTrue())
                }
                
                it("should return TRUE when testing a correct CPF pattern without points and dash:") {
                    expect(LoginValidation.validateCpf(TESTING_DATA.VALID_CPF_WITH_NO_POINTS_AND_DASH)).to(beTrue())
                }
                
                
                it("should return FALSE when testing a correct CPF pattern but all numbers equal:") {
                    expect(LoginValidation.validateCpf(TESTING_DATA.INVALID_CPF_NUMBERS_EQUAL)).to(beFalse())
                }
                
                it("should return FALSE when testing a incorrect CPF pattern:") {
                    expect(LoginValidation.validateCpf(TESTING_DATA.INVALID_CPF_JUNK_TEXT)).to(beFalse())
                }
                
                it("should return FALSE when testing a blank field:") {
                    expect(LoginValidation.validateCpf("")).to(beFalse())
                }
                
                it("should return FALSE when testing a CPF missing a number:") {
                    expect(LoginValidation.validateCpf(TESTING_DATA.INVALID_CPF_MISSING_NUMBER)).to(beFalse())
                }
                
                it("should return FALSE when testing a correct CPF pattern but wrong based on algorithm:") {
                    expect(LoginValidation.validateCpf(TESTING_DATA.INVALID_CPF_WRONG_SEQUENCE_NUMBER)).to(beFalse())
                }
            }
            
            context("USERNAME EMAIL") {
                it("should return TRUE when testing a correct EMAIL pattern:") {
                    expect(LoginValidation.validateEmail(TESTING_DATA.VALID_EMAIL)).to(beTrue())
                }
                
                it("should return FALSE when testing a incorrect EMAIL pattern:") {
                    expect(LoginValidation.validateEmail(TESTING_DATA.INVALID_EMAIL)).to(beFalse())
                }
            }
        }
        
        describe("PASSWORD PATTERN TESTS") {
            it("should return TRUE when testing a password with 6 digits (1 number, 1 special character and 1 capitalized letter):") {
                expect(LoginValidation.validatePassword(TESTING_DATA.VALID_PASSWORD)).to(beTrue())
            }
            
            it("should return TRUE when testing a correct password with more than 6 digits (+1 number, +1 special character and +1 capitalized letter):") {
                expect(LoginValidation.validatePassword(TESTING_DATA.VALID_PASSWORD_MORE_THAN_SIX_DIGITS)).to(beTrue())
            }
            
            it("should return FALSE when testing a blank password:") {
                expect(LoginValidation.validatePassword(TESTING_DATA.INVALID_PASSWORD_BLANK)).to(beFalse())
            }
            
            it("should return FALSE when testing a password with five digits:") {
                expect(LoginValidation.validatePassword(TESTING_DATA.INVALID_PASSWORD_FIVE_DIGITS)).to(beFalse())
            }
            
            it("should return FALSE when testing a password with 6 digits but no numbers:") {
                expect(LoginValidation.validatePassword(TESTING_DATA.INVALID_PASSWORD_NO_NUMBER)).to(beFalse())
            }
            
            it("should return FALSE when testing a password with 6 digits but no special characters:") {
                expect(LoginValidation.validatePassword(TESTING_DATA.INVALID_PASSWORD_NO_CHARACTER)).to(beFalse())
            }
            
            it("should return FALSE when testing a password with 6 digits but no capitalized letter") {
                expect(LoginValidation.validatePassword(TESTING_DATA.INVALID_PASSWORD_NO_CAPITALIZED)).to(beFalse())
            }
        }
    }
}


