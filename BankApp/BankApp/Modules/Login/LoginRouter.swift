//
//  LoginRouter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

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
        // TODO: Refatorar codigo
        // TODO: passar informações de login para próxima tela
        view?.performSegue(withIdentifier: "didLoginSegue", sender: nil)
    }
    
}
