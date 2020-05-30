//
//  StatementTableViewCell.swift
//  BankApp
//
//  Created by Lynneker Souza on 5/29/20.
//  Copyright © 2020 Lynneker Souza. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var shadowView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.shadowView.layer.cornerRadius = 4
        self.shadowView.layer.shadowColor = UIColor.black.cgColor
        self.shadowView.layer.shadowOpacity = 0.2
        self.shadowView.layer.shadowOffset = CGSize.zero
        self.shadowView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
