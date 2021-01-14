//
//  StatementsViewController.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/13/21.
//

import UIKit

class StatementsViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var lb_userName: UILabel!
    @IBOutlet weak var lb_userAccount: UILabel!
    @IBOutlet weak var lb_userBalance: UILabel!
    @IBOutlet weak var tableView_statements: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: Properties
    var interactor: StatementsInteractorProtocol?
    var transactions: [ListStatement.FetchStatement.ViewModel.DisplayedStatement] = []
    
    
    // MARK: View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StatementsRouter.createModule(view: self)
        delegates()
        setupView()
    }
    
    
    // MARK: - Setup View Methods
    
    private func delegates() {
        tableView_statements.delegate = self
        tableView_statements.dataSource = self
    }
    
    private func setupView() {
        interactor?.viewDidLoad()
    }
    
    
    // MARK: - UI Methods
    
    private func loading() {
        self.view.isUserInteractionEnabled = false
        activityIndicator.startAnimating()
    }
    
    private func loaded() {
        activityIndicator.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
    
    
    // MARK: - Button Actions
    
    @IBAction func tapLogoutButton(_ sender: UIButton) {
        interactor?.logout()
    }
    
}

// MARK: - Delegates Methods

extension StatementsViewController: StatementsPresenterDelegate {
    func showUserInfo(_ info: UserInfoViewModel) {
        lb_userName.text = info.name
        lb_userAccount.text = info.account
        lb_userBalance.text = info.balance
    }
    
    func startRequesting() {
        loading()
    }
    
    func finishRequesting() {
        loaded()
    }
    
    func displayStatements(_ statementsList: ListStatement.FetchStatement.ViewModel) {
        transactions = statementsList.displayedStatements
        tableView_statements.reloadData()
    }
    
    func showFailToFetchMessage(_ errorMessage: String) {
        self.showDefaultAlert(title: "Erro", message: errorMessage)
    }
}


// MARK: - TableView Control Methods

extension StatementsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statementCell", for: indexPath) as! StatementTableViewCell
        cell.transaction = transactions[indexPath.row]
        
        return cell
    }
    
}
