//
//  CurrencyProtocols.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Interactor
protocol CurrencyInteractorProtocol: class {
    
}

// MARK: - DataManager
protocol CurrencyLocalDataManagerProtocol: class {
    
}

protocol CurrencyRemoteDataManagerProtocol: class {
    
}

// MARK: - Repository
protocol CurrencyRepositoryProtocol {
    
}

// MARK: - Presenter
protocol CurrencyPresenterProtocol: class {
    
    var view: CurrencyViewProtocol! { get set }
    var router: CurrencyRouterProtocol! { get set }
    var interactor: CurrencyInteractorProtocol! { get set }
    
    func logout()
    
}

// MARK: - View
protocol CurrencyViewProtocol: class {
    
    var presenter: CurrencyPresenterProtocol! { get set }
    
}

// MARK: - Router
protocol CurrencyRouterProtocol: class {
    
    var viewController: UIViewController! { get set }
    
    func logout()
    
}


