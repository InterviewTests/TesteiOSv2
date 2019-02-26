//
//  LoginInteractor.swift
//  Bank
//
//  Created by Administrador on 26/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

protocol LoginBusinessLogic {
    func validateLoginData(user: Login.ViewModel.DiplayedUser)
}

protocol LoginDataStore {
    var user: User? { get }
}
