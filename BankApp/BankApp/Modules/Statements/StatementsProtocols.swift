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
    func presentUserInfo()
    
    func startRequest()
    func finishRequest()
    
    func presentFetchedStatements(response: StatementsModels.Response)
    func didFailToFetchStatement(_ errorMessage: String)
}

/// Presenter -> View
protocol StatementsPresenterDelegate: AnyObject {
    func showUserInfo()
    
    func startRequesting()
    func finishRequesting()
    
    func displayStatements()
    func showFailToFetchStatements(_ errorMessage: String)
}
