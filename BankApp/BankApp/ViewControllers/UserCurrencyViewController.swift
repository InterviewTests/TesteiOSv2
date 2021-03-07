//
//  UserCurrencyViewController.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 04/03/21.
//

import UIKit
import Alamofire

class UserCurrencyViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAccountAndAgencyLabel: UILabel!
    @IBOutlet weak var userAmountLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var userAccount: UserAccount?
    var statements: [UserStatementViewModel] = []
            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.configureTableView()
        self.fillInUserDataLabels()
        
        fetchStatements()                
    }
        
    /// Sets the cell, data source and delegate to `tableView`
    private func configureTableView() {
        self.tableView.register(UINib(nibName: IDENTIFIERS.STORYBOARD.TABLE_VIEW_CELL, bundle: nil),
                                forCellReuseIdentifier: IDENTIFIERS.STORYBOARD.TABLE_VIEW_CELL)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    /// Fills in the labels of the user data with `userAccount` object from `LoginViewController`
    private func fillInUserDataLabels() {
        let userViewModel = UserAccountViewModel(from: userAccount!)
        
        self.userNameLabel.text = userViewModel.userName
        self.userAccountAndAgencyLabel.text = userViewModel.accountWithAgency
        self.userAmountLabel.text = userViewModel.amount
    }
    
    @IBAction func exitButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    /// Fills the `statemens` array with the data fetched from GET` request and shows its contents in table view.
    private func fetchStatements() {
        if let userId = userAccount?.userId {
            let url = "\(REQUESTS.STATEMENTS_ENDPOINT)\(userId)"
            
            let request = AF.request(url)
            request.responseDecodable(of: StatementsData.self) { response in
                if let statementList = response.value {
                    let statements = statementList.statementList
                    
                    for statement in statements {
                        let statementViewModel = UserStatementViewModel(from: statement)
                        self.statements.append(statementViewModel)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}
