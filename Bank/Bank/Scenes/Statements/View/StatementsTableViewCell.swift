//
//  BillSuccessTableViewHeader.swift
//  PSMyAccount
//
//  Created by Roberth on 06/05/19.
//  Copyright © 2019 PagSeguro. All rights reserved.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    func setupStatement(statement: Statement) {
        dateLabel.text = statement.date.convertDate(format: "dd/MM/yyyy", fromFormat: "yyyy-MM-dd")
        valueLabel.textColor = statement.value > 0 ? UIColor(hex6: 0x428D42) : UIColor(hex6: 0x777F8B)
        valueLabel.text = statement.value.currencyFormat()
        descLabel.text = statement.desc
    }
    
}
