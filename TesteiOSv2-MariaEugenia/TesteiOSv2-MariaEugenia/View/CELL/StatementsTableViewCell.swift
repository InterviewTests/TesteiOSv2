//
//  StatementsTableViewCell.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 13/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func configureCell(statement: StatementList) {
        
        titleLabel.text = statement.title
        descriptionLabel.text = statement.desc
        dateLabel.text = statement.date
        valueLabel.text = "\(statement.value ?? 0)"
    }
}
