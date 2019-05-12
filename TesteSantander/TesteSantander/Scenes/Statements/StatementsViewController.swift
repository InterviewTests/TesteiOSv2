//
//  StatementsViewController.swift
//  TesteSantander
//
//  Created by Sidney Silva on 11/05/19.
//  Copyright (c) 2019 Sakura Soft. All rights reserved.
//

import UIKit

protocol StatementsDisplayLogic: class {
    func displayData(viewModel: StatementsModel.Fetch.ViewModel)
    func displayHeaderData(viewModel: StatementsModel.Header.ViewModel)
}

class StatementsViewController: UIViewController, StatementsDisplayLogic {
    var interactor: StatementsBusinessLogic?
    var router: (NSObjectProtocol & StatementsRoutingLogic & StatementsDataPassing)?
    var statementList = [Statement]()

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
        let interactor = StatementsInteractor()
        let presenter = StatementsPresenter()
        let router = StatementsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
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
        fetchData()
        setupHeader()
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    func setupHeader() {
        interactor?.fetchHeader(data: StatementsModel.Header.Request(headerData: router?.dataStore?.userAccount))
    }
    
    func fetchData() {
        interactor?.fetchStatements()
    }
    
    func displayData(viewModel: StatementsModel.Fetch.ViewModel) {
        statementList = viewModel.statementEntries
        self.tableView.reloadData()
    }
    
    func displayHeaderData(viewModel: StatementsModel.Header.ViewModel) {
        nameLabel.text = viewModel.name
        accountLabel.text = viewModel.account
        balanceLabel.text = viewModel.balance
    }
    
    @IBAction func tapDismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension StatementsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.statementCell, for: indexPath) as? StatementsTableViewCell else { return UITableViewCell() }
        let statement = statementList[indexPath.row]
        cell.populateCell(statement: statement)
        return cell
    }
}
