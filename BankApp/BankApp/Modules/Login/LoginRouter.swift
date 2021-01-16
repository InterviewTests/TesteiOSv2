//
//  LoginRouter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import UIKit

class LoginRouter {
    
    weak var view: LoginViewController?
    
    static func createModule(view: LoginViewController) {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
    }
    
    
    func didLogin(data: LoginModels.ViewModel) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let statementsVC = mainStoryboard.instantiateViewController(identifier: "StatementsVC") as! StatementsViewController
        
        StatementsRouter.createModule(view: statementsVC, data: data)
        
        view?.navigationController?.pushViewController(statementsVC, animated: true)
    }
    
}
