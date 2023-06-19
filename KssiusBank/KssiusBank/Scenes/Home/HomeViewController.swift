//
//  HomeViewController.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 17/06/23.
//  Copyright (c) 2023 Cassio Sousa. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayStatements(viewModel: Home.GetStatements.ViewModel)
    func displayAccount(viewModel: Home.GetAccount.ViewModel)
}

final class HomeViewController: UIViewController, HomeDisplayLogic {
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

    // MARK: - Constants

    private let cellStatementIdentifier = "statementCell"
    private var statements = [Home.GetStatements.StatementViewModel]()

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

        let statementsServiceDatasource = StatementsServiceDatasource(networkService: .init())
        let statementsRepository = StatementsRepository(statementsService: statementsServiceDatasource)

        let worker = HomeWorker(statementsRepository: statementsRepository)

        let presenter = HomePresenter()
        let interactor = HomeInteractor(presenter: presenter, worker: worker)

        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        initializeData()
    }


    // MARK: - Outlets

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var accountLabel: UILabel?
    @IBOutlet weak var balanceLabel: UILabel?
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?

    private func setupUI(){
        startState()
        accountLabel?.center = tableView?.center ?? .zero
    }

    @IBAction func didTapLogout(_ sender: Any) {
        router?.dismiss()
    }


    // MARK: Fetch data to display

    private func initializeData() {
        interactor?.retrieveAccount(request: .init())
        interactor?.fetchStatements(request: .init())
    }

    private func startState() {
        activityIndicator?.startAnimating()
    }

    private func finishState() {
        activityIndicator?.stopAnimating()
    }
}

// MARK: - Display informations

extension HomeViewController {

    func displayStatements(viewModel: Home.GetStatements.ViewModel){
        statements = viewModel.statements
        tableView?.reloadData()
        finishState()
    }

    func displayAccount(viewModel: Home.GetAccount.ViewModel){
        nameLabel?.text = viewModel.name
        let numberFormat = viewModel.accountNumber.toAccountFormat ?? ""
        accountLabel?.text = "\(viewModel.agency) / \(numberFormat)"
        balanceLabel?.text = viewModel.balance.toCurrency
    }

}

// MARK: - TableView Delegates
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = tableView.dequeueReusableCell(withIdentifier: cellStatementIdentifier, for: indexPath) as? StatementCell
        else { return .init() }
        row.setup(model: statements[indexPath.row])
        return row
    }
}
