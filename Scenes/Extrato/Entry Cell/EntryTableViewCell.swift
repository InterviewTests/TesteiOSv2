//
//  EntryTableViewCell.swift
//  TesteiOSv2
//
//  Created by Marcel Mendes Filho on 27/02/19.
//  Copyright © 2019 Accenture do Brasil Ltda. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var entryTypeLabel: UILabel!
    @IBOutlet weak var entryDateLabel: UILabel!
    @IBOutlet weak var entryValueLabel: UILabel!
    @IBOutlet weak var entryDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
