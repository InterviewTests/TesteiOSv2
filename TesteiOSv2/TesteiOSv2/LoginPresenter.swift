//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by Felipe Rodrigues Silva on 15/01/19.
//  Copyright © 2019 Felipe Rodrigues Silva. All rights reserved.
//

import UIKit

class LoginPresenter : LogicPresenterLogic{
    
    weak var viewController : LoginViewControllerProceed?
    
    func presentLoginResults(user: UserAccount) {
        print(user.name)
    }
    
    func presentLoginError(with loginErrorEnum: LoginValidationErrorEnum) {
        let errorMensage = loginErrorEnum.errorMensage
        
        let alertController = UIAlertController(title: LOGIN_ERROR_TITTLE, message: errorMensage, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController?.callALertController(alert: alertController)
        
    }
    
}
