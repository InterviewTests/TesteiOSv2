//
//  BankHistoryTableViewCell.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 01/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import UIKit

class BankHistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblPaymentTitle: UILabel!
    @IBOutlet weak var lbPaymentDescription: UILabel!
    @IBOutlet weak var lbPaymentDate: UILabel!
    @IBOutlet weak var lbPaymentValue: UILabel!
    
    func display(_ statement: Statement) {
        configureElements(statement)
    }
    
    private func configureElements(_ statement: Statement) {
        lblPaymentTitle.text = statement.title
        lbPaymentDescription.text = statement.description
        lbPaymentDate.text = statement.date
        lbPaymentValue.text = statement.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
