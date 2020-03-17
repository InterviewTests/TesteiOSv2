//
//  HomeTableViewCell.swift
//  TesteiOSv2
//
//  Created by Mônica Marques on 12/03/20.
//  Copyright © 2020 Mônica Marques. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(value: Statements?) {
        
        if let _value = value {
            self.titleLabel.text = _value.title
            self.descLabel.text = _value.desc
            self.dateLabel.text = _value.date
         //   self.valueLabel.text= _value.value
            
        }
        
    }
    
}
