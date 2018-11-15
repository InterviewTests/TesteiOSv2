//
//  StatementItemTableViewCell.swift
//  TesteiOSv2
//
//  Created by Macintosh on 15/11/18.
//  Copyright © 2018 Roney Sampaio. All rights reserved.
//

import UIKit

class StatementItemTableViewCell: UITableViewCell {
    

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    @IBOutlet weak var itemDate: UILabel!
    @IBOutlet weak var ItemAmmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
