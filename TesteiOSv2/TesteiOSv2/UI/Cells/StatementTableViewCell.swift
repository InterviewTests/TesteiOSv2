//
//  StatementTableViewCell.swift
//  TesteiOSv2
//
//  Created by Brendoon Ryos on 13/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

final class StatementTableViewCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descriptLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var valueLabel: UILabel!
  
  func setup(statement: Statement) {
    titleLabel.text = statement.title
    descriptLabel.text = statement.description
    dateLabel.text = Date.stringFormatter(value: statement.date!)
    valueLabel.text = Double.toCurrency(value: statement.value!)
  }
}
