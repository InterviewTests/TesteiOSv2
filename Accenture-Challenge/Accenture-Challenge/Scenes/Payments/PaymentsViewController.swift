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
    private var router: PaymentsRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.view = paymentsView
    }
}

extension PaymentsViewController {
    
    @objc
    private func didTapLogOutButton() {
        
    }
}

extension PaymentsViewController: PaymentsDisplayLogic {
    
}

