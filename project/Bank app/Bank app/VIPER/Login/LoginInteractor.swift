//
//  LoginInteractor.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol LoginInteractorProtocol: AnyObject {
    var loginInteractorModel : LoginInteractorModel? {get set}
    var loginDTO: LoginDTO? {get set}
    
    func performLogin(username: String, password: String, completion: @escaping(_ loginModelEntity : LoginInteractorModel?, _ error: LoginInteractorError?) -> Void)
    
    func cleanup()
}

final class LoginInteractor: BaseInteractor<LoginPresenterProtocol>, LoginInteractorProtocol {
    var InteractorID = "LoginInteractor"
    var loginInteractorModel : LoginInteractorModel?
    var loginDTO: LoginDTO? {
        didSet{
            self.loginInteractorModel = LoginInteractorModel(loginDTO: loginDTO)
        }
    }
    
    func performLogin(username: String, password: String, completion: @escaping(_ loginModelEntity : LoginInteractorModel?, _ error: LoginInteractorError?) -> Void){
        if (password.hasNumberCharacters() && password.hasSpecialCharacters() && password.hasUperCaseCharacters()){
            
        }else{
            completion(nil, LoginInteractorError.noValidPasswordError)
        }
    }
    
    func cleanup(){
        //TODO: add the cleanup to all subscriptions here
    }
}


enum LoginInteractorError{
    case noValidPasswordError
    case defaultError
}
