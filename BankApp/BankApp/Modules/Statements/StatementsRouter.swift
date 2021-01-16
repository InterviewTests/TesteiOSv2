//
//  StatementsRouter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class StatementsRouter {
    
    class func createModule(view: StatementsViewController, data: LoginModels.ViewModel) {
        let userInfo = StatementsModels.UserInfoResponse(info: data.userInfo)
        
        let interactor = StatementsInteractor(userInfo: userInfo)
        let presenter = StatementsPresenter()
        let router = StatementsRouter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
    }
    
}
