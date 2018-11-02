//
//  LoginRouter.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit
import Foundation

final class LoginRouter: LoginRouterProtocol, Storyboarded {
    
    static let storyboardName = "Login"
    
    weak var viewController: UIViewController!
    
    static func assembleModule() -> UIViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let localDataManager = LoginLocalDataManager()
        let remoteDataManager = LoginRemoteDataManager()
        let repository = LoginRepository(localDataManager: localDataManager, remoteDataManager: remoteDataManager)
        let interactor = LoginInteractor(repository: repository)
        
        view.presenter = presenter
        
        router.viewController = view
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
    
    static func LoginViewController() -> LoginViewController {
        return storyboard.instantiateViewController()
    }
    
    func presentCurrencyScreen() {
        let currencyView = CurrencyRouter.assembleModule()
        let navigationController = UINavigationController(rootViewController: currencyView)
        viewController.present(navigationController, animated: true, completion: nil)
    }
    
}
