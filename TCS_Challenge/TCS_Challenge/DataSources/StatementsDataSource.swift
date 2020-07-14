//
//  StatementsDataSource.swift
//  TCS_Challenge
//
//  Created by Rafael Valer on 14/07/20.
//  Copyright © 2020 Rafael Valer. All rights reserved.
//

import Foundation
import UIKit

class StatementsDataSource: NSObject {
    
    var statements: [AccountDetails.FetchStatements.ViewModel.DisplayedStatement]
    
    init(statements: [AccountDetails.FetchStatements.ViewModel.DisplayedStatement]) {
        self.statements = statements
    }
}

// MARK: - UITableViewDataSource
extension StatementsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: StatementTableViewCell.identifier, for: indexPath) as! StatementTableViewCell
        cell.setup(withViewModel: statements[indexPath.row])
        
        return cell
    }
}
