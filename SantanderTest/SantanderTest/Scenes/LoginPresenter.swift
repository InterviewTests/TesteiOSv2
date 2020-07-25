//
//  LoginPresenter.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func presentSomething(response: Login.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    // MARK: Presentation logic
    
    func presentSomething(response: Login.Response) {
        let viewModel = Login.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
