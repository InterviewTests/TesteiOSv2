//
//  LoginPresenter.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit

final class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: LoginViewProtocol!
    var router: LoginRouterProtocol!
    var interactor: LoginInteractorProtocol!
    
    func buttonLoginPressed(userName: String?, password: String?) {
        let paranRsquest = ["user" : "test_user",
                            "password" : "Test@444444"]
        
        ApiService.sharedInstance.login(paranRsquest) { response in
            switch response.result{
            case .success:
                let data = response.result.value as! [String: Any]
                let user: UserAccount = UserAccount(JSON: data["userAccount"] as! [String: Any])!
                
                self.router.presentCurrencyScreen(manager: user)
                break
            case .failure(let error):
                debugPrint(error)
                break
            }
        }
        
    }
    
}
