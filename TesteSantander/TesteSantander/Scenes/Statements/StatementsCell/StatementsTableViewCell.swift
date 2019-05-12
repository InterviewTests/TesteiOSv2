//
//  StatementsTableViewCell.swift
//  TesteSantander
//
//  Created by Sidney Silva on 12/05/19.
//  Copyright © 2019 Sakura Soft. All rights reserved.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func populateCell(statement: Statement) {
        titleLabel.text = statement.title ?? ""
        descLabel.text = statement.desc ?? ""
        dateLabel.text = statement.date?.convertDataFormat() ?? ""
        valueLabel.text = String(format: "R$ $%.02f", statement.value ?? "")
    }
}
