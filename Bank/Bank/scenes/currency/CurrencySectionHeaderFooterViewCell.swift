//
//  CurrencySectionHeaderFooterViewCell.swift
//  Bank
//
//  Created by Thiago Lima on 20/01/19.
//  Copyright © 2019 SantanderTecnologia. All rights reserved.
//

import UIKit

class CurrencySectionHeaderFooterViewCell: UITableViewCell {
    
    @IBOutlet var lb_title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTitle(_ titulo: String) {
        self.lb_title.text = titulo
    }

}
