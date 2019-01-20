//
//  CurrencyTableViewCell.swift
//  Bank
//
//  Created by Thiago Lima on 20/01/19.
//  Copyright © 2019 SantanderTecnologia. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet var lb_title: UILabel!
    @IBOutlet var lb_desc: UILabel!
    @IBOutlet var lb_date: UILabel!
    @IBOutlet var lb_value: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepararCell(_ statement: Currency.Statement) {
        self.lb_title.text = statement.title
        self.lb_desc.text = statement.desc
        self.lb_date.text = statement.date.string(with: "dd/MM/yyyy")
        self.lb_value.text = String(format: "R$ %.02f", locale: Locale.current, arguments: [statement.value])
    }

}
