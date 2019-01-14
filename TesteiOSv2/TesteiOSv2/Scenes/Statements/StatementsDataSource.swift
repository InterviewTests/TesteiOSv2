//
//  StatementsDataSource.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 13/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class StatementsDataSource: NSObject {
  private let identifier = "StatementTableViewCell"
  
  weak var tableView: UITableView? {
    didSet {
      let nib = UINib(nibName: identifier, bundle: .main)
      tableView?.register(nib, forCellReuseIdentifier: identifier)
    }
  }
  
  var statements: [Statement] = [] {
    didSet {
      tableView?.reloadData()
    }
  }
}

extension StatementsDataSource: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return statements.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! StatementTableViewCell
    cell.setup(statement: statements[indexPath.row])
    return cell
  }
}
