//
//  StatementListViewController+UITableView.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import UIKit

extension StatementListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableViewOnLoad() {
        tableView.register(UINib(nibName: "StatementCell", bundle: Bundle.main), forCellReuseIdentifier: cellIdentifiers.statementCell)
        tableView.register(UINib(nibName: "AccountDetailsCell", bundle: Bundle.main), forCellReuseIdentifier: cellIdentifiers.accountCell)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let displayStatement = statements[indexPath.row]
            if let statementCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.statementCell) as? StatementCell {
                statementCell.set(statement: displayStatement)
                return statementCell
            }
        } else {
            guard let displayAccount = router?.dataDestination.user else {return UITableViewCell()}
            if let accountCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.accountCell) as? AccountDetailsCell {
                accountCell.set(account: displayAccount)
                accountCell.delegate = self
                return accountCell
            }
        }
        return UITableViewCell()
    }
}
