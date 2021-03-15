//
//  LoginInteractor.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 15/03/21.
//

import Foundation

protocol LoginBusinessLogic: class {
    func applyBusinessLogicIn(request: Login.Login.Request)
}

class LoginInteractor: LoginBusinessLogic {
    func applyBusinessLogicIn(request: Login.Login.Request) {
        print("Vou aplicar logica de negocio em \(request.fields.username) e \(request.fields.password)")
    }
}
