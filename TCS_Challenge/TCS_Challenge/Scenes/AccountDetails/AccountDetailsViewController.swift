//
//  AccountDetailsViewController.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 13/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import UIKit

protocol AccountDetailsDisplayLogic: class {
    func displayFetchedStatements(viewModel: AccountDetails.FetchStatements.ViewModel)
}

class AccountDetailsViewController: UIViewController {
    
    var interactor: AccountDetailsBusinessLogic?
    var router: (NSObject & AccountDetailsRoutingLogic & AccountDetailsDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = AccountDetailsInteractor()
        let presenter = AccountDetailsPresenter()
        let router = AccountDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchStatements()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - AccountDetailsDisplayLogic
extension AccountDetailsViewController: AccountDetailsDisplayLogic {
    func displayFetchedStatements(viewModel: AccountDetails.FetchStatements.ViewModel) {
//        let displayedStatements = viewModel.displayedStatements
        // tableView.reloadData
    }
}
