//
//  LoginInteractor.swift
//  TesteiOSv2
//
//  Created by Foliveira on 03/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol {
    func fetchUserData()
}

class LoginInteractor: LoginInteractorProtocol {
    
    var presenter: LoginPresenterProtocol?
    
    func fetchUserData() {
        presenter?.presentUserData()
    }
}
