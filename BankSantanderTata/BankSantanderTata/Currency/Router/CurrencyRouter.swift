//
//  CurrencyRouter.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit

final class CurrencyRouter: CurrencyRouterProtocol, Storyboarded {
    
    static let storyboardName = "Currency"
    
    weak var viewController: UIViewController!
    
    static func assembleModule(_ manager: UserAccount) -> UIViewController {
        let view = CurrencyViewController()
        let presenter = CurrencyPresenter()
        let router = CurrencyRouter()
        let localDataManager = CurrencyLocalDataManager()
        let remoteDataManager = CurrencyRemoteDataManager()
        let repository = CurrencyRepository(localDataManager: localDataManager, remoteDataManager: remoteDataManager)
        let interactor = CurrencyInteractor(repository: repository)
        
        view.presenter = presenter
        
        router.viewController = view
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        view.data = manager
        return view
    }
    
    static func CurrencyViewController() -> CurrencyViewController {
        return storyboard.instantiateViewController()
    }
    
    func logout() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
}
