//
//  StatementsRouter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import Foundation

class StatementsRouter {
    
    weak var view: StatementsViewController?
    
    class func createModule(view: StatementsViewController) {
        let interactor = StatementsInteractor()
        let presenter = StatementsPresenter()
        let router = StatementsRouter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
        router.view = view
        //router.dataStore = interactor
    }
    
    func logout() {
        view?.navigationController?.popViewController(animated: true)
        view?.dismiss(animated: true, completion: nil)
    }
}
