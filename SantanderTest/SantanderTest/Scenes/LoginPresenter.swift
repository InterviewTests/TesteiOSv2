//
//  LoginPresenter.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/07/20.
//  Copyright (c) 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol LoginPresentationLogic {
    func onError(title: String, message: String)
    func shouldPresentLoading(_ isLoading: Bool)
}

class LoginPresenter: LoginPresentationLogic {

    weak var viewController: LoginDisplayLogic?
    
    // MARK: Presentation logic
    func onError(title: String, message: String) {
        viewController?.displayError(title: title, message: message)
    }
    
    func shouldPresentLoading(_ isLoading: Bool) {
        viewController?.displayLoading(isLoading)
    }
}
