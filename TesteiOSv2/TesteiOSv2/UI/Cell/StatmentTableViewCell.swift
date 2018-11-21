//
//  StatmentTableViewCell.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

class StatmentTableViewCell: UITableViewCell {
    
    static var cellHeight: CGFloat {
        return 100
    }
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var titlePaymentLabel: UILabel!
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var invoiceNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.roundedView.dropShadow()
    }
    
    func setupCell(statement:Statement) {
        titlePaymentLabel.text = statement.title
        invoiceNameLabel.text = statement.description
        if let date = statement.date {
            dateLabel.text = date.ISOString
        }
        if let value = statement.value {
            if let currency = value.toCurrency(){
                valueLabel.text = "\(currency)"
            }
        }
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
