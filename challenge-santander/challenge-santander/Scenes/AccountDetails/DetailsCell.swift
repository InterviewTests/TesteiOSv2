//
//  DetailsCell.swift
//  challenge-santander
//
//  Created by Hugo Ferreira on 17/05/20.
//  Copyright © 2020 Hugo Ferreira. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var viewCell: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewCell.layer.cornerRadius = 6
        viewCell.layer.shadowColor = #colorLiteral(red: 0.8509803922, green: 0.8862745098, blue: 0.9137254902, alpha: 1)
        viewCell.layer.shadowOffset = CGSize(width: 6, height: 6)
        viewCell.layer.shadowRadius = 6
        viewCell.layer.shadowOpacity = 0.5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
