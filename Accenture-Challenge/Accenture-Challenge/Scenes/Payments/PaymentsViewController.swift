//
//  PaymentsViewController.swift
//  Accenture-Challenge
//
//  Created by Pedro Alvarez on 04/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

protocol PaymentsDisplayLogic: class {
    
}

class PaymentsViewController: UIViewController {
    
    private lazy var logOutButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.addTarget(self, action: #selector(didTapLogOutButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerView: PaymentMainHeaderView = {
        return PaymentMainHeaderView(frame: .zero,
                                     logOutButton: logOutButton)
    }()
    
    private lazy var tableView: UITableView = {
        return UITableView(frame: .zero)
    }()
    
    private lazy var paymentsView: PaymentsView = {
        return PaymentsView(frame: .zero,
                            headerView: headerView,
                            tableView: tableView)
    }()
    
    private var interactor: PaymentsBusinessLogic?
    var router: PaymentsRouterProtocol?
    
    private var viewModel: Payments.Info.ViewModel.Payment?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = paymentsView
    }
    
    private func setup() {
        let viewController = self
        let interactor = PaymentsInteractor(viewController: viewController)
        let router = PaymentsRouter()
        router.dataStore = interactor
        router.viewController = viewController
        viewController.router = router
        viewController.interactor = interactor
    }
    
    private func fetch() {
        interactor?.fetchUserInfo(Payments.Request.UserInfo())
        interactor?.fetchStatements()
    }
}

extension PaymentsViewController {
    
    @objc
    private func didTapLogOutButton() {
        
    }
}

extension PaymentsViewController: PaymentsDisplayLogic {
    
}

