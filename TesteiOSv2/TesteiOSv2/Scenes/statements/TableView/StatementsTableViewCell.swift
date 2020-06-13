//
//  StatementsTableViewCell.swift
//  TesteiOSv2
//
//  Created by Foliveira on 11/06/20.
//  Copyright © 2020 Foliveira. All rights reserved.
//

import UIKit

class StatementsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        cellView.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        cellView.layer.cornerRadius = 8
        cellView.layer.shadowOffset = CGSize.zero
        cellView.layer.shadowRadius = 3
        cellView.layer.shadowOpacity = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(type: String, date: String, desc: String, value: String){
        typeLabel.text = type
        dateLabel.text = date
        descLabel.text = desc
        valueLabel.text = value
    }
    
}
