//
//  LoginPresenter.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 26/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

protocol LoginPresenterProtocol {
    
    var controller : LoginResponseStatus? {get set}
    
    func logonSuccess(account:Account)
    func logonFailure(message:String)
    func passLastLogon(_ loginInfo : UserLoginInfo?)
}

class LoginPresenter: NSObject, LoginPresenterProtocol {
    
    
    var controller: LoginResponseStatus?
    
    func passLastLogon(_ loginInfo : UserLoginInfo?) {
        self.controller?.receiveLastLogon(loginInfo)
    }
    
    func logonSuccess(account: Account) {
        controller?.logoSuccess(account: account)
    }
    
    func logonFailure(message: String) {
        controller?.logonFailure(message: message)
    }
    
//    func formatAgencyConta(account:Account) {
//        var numberCount = account.bankAccount
//        numberCount.insert(".", at: numberCount.index(numberCount.startIndex, offsetBy: 2))
//        if numberCount.count >= 9 {
//            numberCount.insert("-", at: numberCount.index(numberCount.startIndex, offsetBy: 9))
//        }
//        account.agencyConta = "\(account.agency / numberCount)"
//    }
    
}
