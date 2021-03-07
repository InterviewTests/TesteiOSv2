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
                
        self.tableView.register(UINib(nibName: IDENTIFIERS.TABLE_VIEW_CELL, bundle: nil),
                                forCellReuseIdentifier: IDENTIFIERS.TABLE_VIEW_CELL)
                
        self.tableView.dataSource = self
        self.tableView.delegate = self
                    
        let userViewModel = UserAccountViewModel(from: userAccount!)
        self.userNameLabel.text = userViewModel.userName
        self.userAccountAndAgencyLabel.text = userViewModel.accountWithAgency
        self.userAmountLabel.text = userViewModel.amount        
        
        fetchStatements()                
    }
    
    @IBAction func exitButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    private func fetchStatements() {
        if let userId = userAccount?.userId {
            let url = "\(REQUESTS.STATEMENTS_ENDPOINT)\(userId)"
            
            let request = AF.request(url)
            
            request.responseDecodable(of: StatementsData.self) { response in
                if let statementList = response.value {
                    let statements = statementList.statementList
                    
                    for statement in statements {
                        let userStatementViewModel = UserStatementViewModel(from: statement)
                        self.statements.append(userStatementViewModel)
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
}

extension UserCurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIERS.TABLE_VIEW_CELL, for: indexPath) as? StatementTableViewCell {

            let currentStatement = self.statements[indexPath.row]
            
            cell.titleLabel.text = currentStatement.title
            cell.descriptionLabel.text = currentStatement.description
            cell.dateLabel.text = currentStatement.date
            cell.valueLabel.text = currentStatement.value
            cell.valueLabel.textColor = setLabelColorBasedOn(value: currentStatement.value)
                
//            cell.backgroundColor = UIColor.white
//            cell.layer.borderColor = UIColor.gray.cgColor
//            cell.layer.borderWidth = 1
//            cell.layer.cornerRadius = 8
//            cell.clipsToBounds = false
//            
            return cell
        }
                        
        return UITableViewCell()
    }
    
    private func setLabelColorBasedOn(value: String) -> UIColor {
        if value.contains("-") {
            return UIColor.red
        }
        
        return UIColor.green
    }
}
