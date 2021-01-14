//
//  LoginRouter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import UIKit

class LoginRouter {
    
    weak var view: LoginViewController?
    
    class func createModule(view: LoginViewController) {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
        //router.dataStore = interactor
    }
    
    func didLogin() {
        view?.performSegue(withIdentifier: "didLoginSegue", sender: nil)
    }
}
