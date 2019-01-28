//
//  StatementViewController+UITableView.swift
//  TestSantander-IBM
//
//  Created by Renato Carvalhan on 25/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import UIKit

extension StatementViewController: UITableViewDelegate, UITableViewDataSource {
    
    struct cellIdentifiers {
        static let statementCell = "StatementCell"
        static let headerCell = "StatementHeaderCell"
    }
    
    func registerCellOnTableView() {
        tableView.register(UINib(nibName: cellIdentifiers.headerCell, bundle: Bundle.main), forCellReuseIdentifier: cellIdentifiers.headerCell)
        tableView.register(UINib(nibName: cellIdentifiers.statementCell, bundle: Bundle.main), forCellReuseIdentifier: cellIdentifiers.statementCell)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.headerCell) as! StatementHeaderCell
        view.set(title: "Recentes");
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayStatement = statements[indexPath.row]
        if let statementCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.statementCell) as? StatementCell {
            statementCell.set(statement: displayStatement)
            return statementCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
