//
//  LoginPresenter.swift
//  TesteiOSv2
//
//  Created by Jose Neves on 11/01/19.
//  Copyright © 2019 joseneves. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func presentUser(response: Login.LoginUser.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentUser(response: Login.LoginUser.Response) {
        let viewModel = Login.LoginUser.ViewModel(user: response.user)
        viewController?.sendToStatements(viewModel: viewModel)
    }
}
