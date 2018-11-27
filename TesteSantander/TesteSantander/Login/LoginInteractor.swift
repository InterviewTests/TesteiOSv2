//
//  LoginInteractor.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 24/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

protocol DoLoginInteractor {
    var worker : LoginWorkerProtocol? {get set}
    var presenter : LoginPresenterProtocol? {get set}
    func doLogin(_ userLogin:UserLoginInfo)
    func fetchLastLogon()
    
}

typealias UserLoginInfo = (user:String, password:String)

class LoginInteractor: NSObject, DoLoginInteractor {
    
    var worker : LoginWorkerProtocol?
    var presenter: LoginPresenterProtocol?
    
    func doLogin(_ userLogin:UserLoginInfo) {
        let validPassword = isValidPassword(userLogin.password)
        if validPassword {
            
            self.worker?.doAuthentication(userLogin, sucess: { (response) in
                self.presenter?.logonSuccess(account: response.userAccount)
            }, failure: { (error) in
                self.presenter?.logonFailure(message: error.localizedDescription)
            })
            
        } else {
            self.presenter?.logonFailure(message: GeneralError.invalidPassword.localizedDescription)
        }
    }
    
    func isValidPassword(_ password:String) -> Bool {
        
        let isHasSpecial = password.isContainSpecialCharacter()
        let isHasUpperCase = password.isContainsUpperCase()
        return isHasSpecial && isHasUpperCase
        
    }
    
    func fetchLastLogon() {
        let userLoginInfo = self.worker?.fetchLastLogon()
        self.presenter?.passLastLogon(userLoginInfo)
    }
}

extension String {
    
    func isContainSpecialCharacter() -> Bool{
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if (self.rangeOfCharacter(from: characterset.inverted) == nil){
            return false
        }
        return true
    }
    
    func isContainsUpperCase() -> Bool {
        let upperCase = CharacterSet.uppercaseLetters
        for currentCharacter in self.unicodeScalars {
            if upperCase.contains(currentCharacter) {
                return true
            }
        }
        return false
    }
    
}




