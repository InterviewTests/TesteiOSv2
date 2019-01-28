//
//  StatementCell.swift
//  TestSantander-IBM
//
//  Created by Renato Carvalhan on 25/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import UIKit

class StatementCell: UITableViewCell {
    
    @IBOutlet var cardView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardLayout(view: cardView)
    }
    
    func cardLayout(view: UIView) {
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 5
    }

    func set(statement: Statement) {
        self.titleLabel.text = statement.title
        self.descriptionLabel.text = statement.desc
        self.dateLabel.text = statement.date!.formatDate()
        
        if statement.value! < 0 {
            valueLabel.textColor = UIColor.red
        } else {
            valueLabel.textColor = UIColor.darkGray
        }
        
        valueLabel.text = String.formatCurrency(value: statement.value!)
    }
    
}
