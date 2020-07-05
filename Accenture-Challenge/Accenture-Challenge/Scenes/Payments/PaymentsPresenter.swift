//
//  PaymentsPresenter.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol PaymentsPresentationLogic {
    func didFetchUserAccount(_ response: Payments.Info.ViewModel.UserAccount)
}

class PaymentsPresenter: PaymentsPresentationLogic {
    
    private unowned var viewController: PaymentsDisplayLogic
    
    init(viewController: PaymentsDisplayLogic) {
        self.viewController = viewController
    }
    
    func didFetchUserAccount(_ response: Payments.Info.ViewModel.UserAccount) {
        
    }
}
