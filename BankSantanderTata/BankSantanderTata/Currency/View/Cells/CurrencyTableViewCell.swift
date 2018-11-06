//
//  CurrencyTableViewCell.swift
//  BankSantanderTata
//
//  Created by Wagner Rodrigues on 02/11/18.
//  Copyright © 2018 Wagner Rodrigues. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelDesc: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var labelValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(statement: Statement){
        labelTitle.text = statement.title
    }
    
}
