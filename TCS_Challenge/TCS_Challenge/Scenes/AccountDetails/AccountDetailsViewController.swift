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
    func displayFetchedAccountInfo(viewModel: AccountDetails.FetchAccountInfo.ViewModel)
    func logoutUser()
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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
        fetchAccountInfo()
        fetchStatements()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - UI Setup
    
    private let refreshControl = UIRefreshControl()
    
    private func setupTable() {
        
        dataSource = StatementsDataSource(statements: [])
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: StatementTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: StatementTableViewCell.identifier)
        tableView.register(UINib(nibName: StatementTableSectionHeaderView.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: StatementTableSectionHeaderView.identifier)
        
        let headerView = tableView.tableHeaderView as! StatementTableHeaderView
        headerView.delegate = self
        headerView.setupView()
        
        refreshControl.addTarget(self, action: #selector(refreshStatements(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func refreshStatements(_ sender: Any) {
        fetchStatements()
    }
    
    // MARK: - Fetch Data
    
    private var dataSource: StatementsDataSource!
    
    private func fetchStatements() {
        interactor?.fetchStatements()
    }
    
    private func fetchAccountInfo() {
        interactor?.fetchAccountInfo()
    }
}

// MARK: - AccountDetailsDisplayLogic
extension AccountDetailsViewController: AccountDetailsDisplayLogic {
    
    func displayFetchedAccountInfo(viewModel: AccountDetails.FetchAccountInfo.ViewModel) {
        if let headerView = tableView.tableHeaderView as? StatementTableHeaderView {
            headerView.update(withViewModel: viewModel)
        }
    }
    
    func displayFetchedStatements(viewModel: AccountDetails.FetchStatements.ViewModel) {
        let displayedStatements = viewModel.displayedStatements
        dataSource.statements = displayedStatements
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    
    func logoutUser() {
        router?.navigateToLogin(source: self)
    }
}

// MARK: - UITableViewDelegate
extension AccountDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return StatementTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: StatementTableSectionHeaderView.identifier)
        
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return StatementTableSectionHeaderView.headerHeight
    }
}

// MARK: - StatementTableHeaderViewDelegate
extension AccountDetailsViewController: StatementTableHeaderViewDelegate {
    func logoutButtonTapped() {
        logoutUser()
    }
}
