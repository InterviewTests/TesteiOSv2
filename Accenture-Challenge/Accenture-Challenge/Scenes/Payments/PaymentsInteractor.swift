//
//  PaymentsInteractor.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

protocol PaymentsBusinessLogic {
    func fetchUserInfo(_ request: Payments.Request.UserInfo)
    func fetchStatements()
}

protocol PaymentsDataStore {
    var userAccount: Payments.Received.UserAccount? { get set }
    var payments: [Payments.Info.PaymentModel] { get set }
}

class PaymentsInteractor: PaymentsDataStore {
    
    private var presenter: PaymentsPresentationLogic
    private var worker: PaymentsWorkerProtocol
    
    var userAccount: Payments.Received.UserAccount?
    var payments: [Payments.Info.PaymentModel] = []
    
    init(viewController: PaymentsDisplayLogic) {
        self.presenter = PaymentsPresenter(viewController: viewController)
        self.worker = PaymentsWorker()
    }
}

extension PaymentsInteractor: PaymentsBusinessLogic {
    
    func fetchUserInfo(_ request: Payments.Request.UserInfo) {
        guard let userAccount = userAccount else { return }
        let formattedAccountInfo = "\(userAccount.agency ?? .empty) / \(userAccount.bankAccount)"
        let viewModel = Payments.Info.ViewModel.UserAccount(name: userAccount.name ?? .empty , accountInfo: formattedAccountInfo, balance: "\(userAccount.balance)")
        presenter.didFetchUserAccount(viewModel)
    }
    
    func fetchStatements() {
        guard let userId = userAccount?.userId else { return }
        worker.fetchStatements(Payments.Request.Statements(userId: String(userId))) { response in
            switch response {
            case .success(let statements):
                
                break
            case .error(let error):
                break
            case .genericError: break
                
            }
        }
    }
}
