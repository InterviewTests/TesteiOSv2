//
//  LoginProtocols.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Interactor
protocol LoginInteractorProtocol: class {
    
}

// MARK: - DataManager
protocol LoginLocalDataManagerProtocol: class {
    
}

protocol LoginRemoteDataManagerProtocol: class {
    
}

// MARK: - Repository
protocol LoginRepositoryProtocol {
    
}

// MARK: - Presenter
protocol LoginPresenterProtocol: class {
    
    var view: LoginViewProtocol! { get set }
    var router: LoginRouterProtocol! { get set }
    var interactor: LoginInteractorProtocol! { get set }
    
    func buttonLoginPressed(userName: String?, password: String?)
    
}

// MARK: - View
protocol LoginViewProtocol: class {
    
    var presenter: LoginPresenterProtocol! { get set }
    
    func clearFields()
    
}

// MARK: - Router
protocol LoginRouterProtocol: class {
    
    var viewController: UIViewController! { get set }
    
    func presentCurrencyScreen()
    
}


