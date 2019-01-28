//
//  StatementHeaderCell.swift
//  TestSantander-IBM
//
//  Created by Renato Carvalhan on 27/01/19.
//  Copyright © 2019 Renato Carvalhan. All rights reserved.
//

import UIKit

class StatementHeaderCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(title: String) {
        titleLabel.text = title
    }
}
