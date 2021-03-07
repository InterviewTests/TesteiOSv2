//
//  StatementTableViewCell.swift
//  BankApp
//
//  Created by Adriano Rodrigues Vieira on 06/03/21.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
    }
    
}


