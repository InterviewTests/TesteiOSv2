//
//  StatementsRouter.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import Foundation

class StatementsRouter {
    
    class func createModule(view: StatementsViewController) {
        // TODO: dado mockado
        let userInfo = StatementsModels.UserInfoResponse(info: LoginModels.LoggedinUserEntity(userInfo: LoggedinUserStruct(userId: 1, name: "Bruno Ramos Maciel", bankAccount: "1234", agency: "012345678", balance: 678.98))!)
        
        let interactor = StatementsInteractor(userInfo: userInfo)
        let presenter = StatementsPresenter()
        let router = StatementsRouter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        presenter.router = router
    }
    
}
