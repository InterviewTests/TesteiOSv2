//
//  StatementsProtocols.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

/// View -> Interactor
protocol StatementsInteractorProtocol: AnyObject {
    func viewDidLoad()
    func logout()
}

/// Interactor -> Presenter
protocol StatementsPresenterProtocol: AnyObject {
    
}

/// Presenter -> View
protocol StatementsPresenterDelegate: AnyObject {
    
}
