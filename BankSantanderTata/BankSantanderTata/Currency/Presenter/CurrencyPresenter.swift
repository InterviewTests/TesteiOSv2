//
//  CurrencyPresenter.swift
//  BankSantanderTata
//
//  Created on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit

final class CurrencyPresenter: CurrencyPresenterProtocol {
    
    weak var view: CurrencyViewProtocol!
    var router: CurrencyRouterProtocol!
    var interactor: CurrencyInteractorProtocol!
    
    func logout() {
        self.router.logout()
    }
    
}
