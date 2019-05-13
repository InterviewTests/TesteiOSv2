//  Created by Fabio Souza de Morais on 12/05/19.
//  Copyright (c) 2019 Fabio Morais. All rights reserved.

import UIKit

protocol StatementsDisplayLogic: class {
    func setHeaderData(viewModel: StatementsModel.Header.ViewModel)
    func setData(viewModel: StatementsModel.Fetch.ViewModel)
    func showAlertError(error: String)
}

class StatementsViewController: UIViewController {
    
    var interactor: StatementsBusinessLogic?
    var router: (NSObjectProtocol & StatementsRoutingLogic & StatementsDataPassing)?
    var statementList = [StatementList]()

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var accountNumber: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        headerSetup()
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    private func getData() {
        interactor?.getStatements()
    }
    
    private func headerSetup() {
        interactor?.getHeader(data: StatementsModel.Header.Request(headerDataResponse: router?.dataStore?.userAccount))
    }
    
    @IBAction func actLogout(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK:- Display logic

extension StatementsViewController: StatementsDisplayLogic {
    
    func setHeaderData(viewModel: StatementsModel.Header.ViewModel) {
        userName.text = viewModel.name
        accountNumber.text = viewModel.account
        balance.text = viewModel.balance
    }
    
    func setData(viewModel: StatementsModel.Fetch.ViewModel) {
        statementList = viewModel.statementEntries
        self.tableView.reloadData()
    }
    
    func showAlertError(error: String) {
        UILoader.shared.hideLoader()
        let alert = UIAlertController(title: "atenção", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension StatementsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.statementsCell, for: indexPath) as? StatementsTableViewCell else { return UITableViewCell() }
        let statement = statementList[indexPath.row]
        cell.fillInCell(statement: statement)
        return cell
    }
}
