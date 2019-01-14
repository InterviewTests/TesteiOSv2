//
//  StatementsViewController.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 13/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

class StatementsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var statementsList = [StatementList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        TesteAPIManager.shared.getStatments(failure: { (error) in
            self.presentMessage(error ?? "Tivemos um problema, tente novamente.")
        }) { (statementsResult) in
            if let list = statementsResult?.statementList {
                self.statementsList = list
                self.tableView.reloadData()
            } else if let errorMessage = statementsResult?.error?.message {
                self.presentMessage(errorMessage)
            }
        }
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
    }
    

}

extension StatementsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? StatementsTableViewCell else { return UITableViewCell() }
        
        let statement = statementsList[indexPath.row]
        cell.configureCell(statement: statement)
        
        return cell
    }
}
