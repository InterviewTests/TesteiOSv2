//
//  LoginPresenter.swift
//  Bank app
//
//  Created by mmalaqui on 18/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol: AnyObject {
    var viewModel: LoginViewModel? { get set }
    func loginViewDidLoad()
    func cleanup()
}

final class LoginPresenter: BasePresenter<LoginView, LoginRouterProtocol, LoginInteractorProtocol>, LoginPresenterProtocol {
    var viewModel: LoginViewModel?
    

    func loginViewDidLoad() {
        //TODO
        self.interactor?.getLoginData(completion: { (_ loginInteractorModel:LoginInteractorModel) -> Void in
            self.viewModel = LoginViewModel(loginInteractorModel: loginInteractorModel)
            //TODO: update view
        })
        
    }
    
    
    func cleanup(){
        self.interactor?.cleanup()
    }
}
