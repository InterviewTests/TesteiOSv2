//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright (c) 2019 Accenture. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginBusinessLogic
{
    func doLogin(request: Login.LoginModels.Request)
}

protocol LoginDataStore
{
    var userModel: UserModel { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var userModel: UserModel = UserModel()
    
    // MARK: Do something
    
    func doLogin(request: Login.LoginModels.Request)
    {
        
        guard let user = request.user, let password = request.password  else {
            presenter?.presentAlert()
            return
        }
        
        if !isValidEmail(email: user) || !isValidPassword(password: password){
            presenter?.presentAlert()
            return
        }
        
        worker = LoginWorker()
        worker?.doLogin(success: { (userModel) in
            
            let response = Login.LoginModels.Response(userModel: userModel)
            self.userModel = userModel
            self.presenter?.presentHome(response: response)
            
        }, failure: { (error) in
            print(error)
        })
        
    }
}

//MARK: - Validations
extension LoginInteractor{
    
    func isValidEmail(email:String) -> Bool {
        if email.count == 0{
            return false
        }
        let emailTest = NSPredicate(format:"SELF MATCHES %@", Regex.email.rawValue)
        print("isValidEmail - \(emailTest.evaluate(with: email))")
        return emailTest.evaluate(with: email)
        
    }
    
    func isValidPassword(password:String) -> Bool {
        if password.count == 0{
            return false
        }
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", Regex.password.rawValue)
        print("isValidPassword - \(passwordTest.evaluate(with: password))")
        return passwordTest.evaluate(with: password)
    }
    
}
