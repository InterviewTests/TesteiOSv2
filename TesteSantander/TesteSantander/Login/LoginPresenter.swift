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
}

class LoginPresenter: NSObject, LoginPresenterProtocol {
    
    
    var controller: LoginResponseStatus?
    
    func logonSuccess(account: Account) {
        controller?.logoSuccess(account: account)
    }
    
    func logonFailure(message: String) {
        controller?.logonFailure(message: message)
    }
    
}
