//
//  PaymentsInteractor.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol PaymentsBusinessLogic {
    
}

protocol PaymentsDataStore {
    
}

class PaymentsInteractor: PaymentsDataStore {
    
    private var presenter: PaymentsPresentationLogic
    private var worker: PaymentsWorkerProtocol
    
    init(viewController: PaymentsDisplayLogic) {
        self.presenter = PaymentsPresenter(viewController: viewController)
        self.worker = PaymentsWorker()
    }
    
}

extension PaymentsInteractor: PaymentsBusinessLogic {
    
}
