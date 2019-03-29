//
//  StatementTableViewCell.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 29/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        shadow(in: view, color: UIColor.black, offset: CGSize(width: 0, height: 2), opacity: 0.1, radius: 3)
        corner(in: view, radius: 5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(statement: Statement) {
        titleLabel.text = statement.title
        dateLabel.text = FormatterHelper.dateFormat(string: statement.date ?? "")
        descriptionLabel.text = statement.desc
        
        let value = abs(statement.value ?? 0.0)
        valueLabel.text = FormatterHelper.formatCurrency(value: NSNumber(value: value))
    }

}
