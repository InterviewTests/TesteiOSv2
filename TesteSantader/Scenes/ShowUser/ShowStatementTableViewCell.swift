//
//  ShowStatementTableViewCell.swift
//  TesteSantader
//
//  Created by Bruno Chen on 09/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import UIKit

class ShowStatementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
