//
//  HomeTableViewCell.swift
//  Bank app
//
//  Created by mmalaqui on 20/05/2020.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: .zero, height: 10)
        layer.shadowRadius = 4
        layer.shadowColor = ((UIColor(named: "shadowColor") ?? UIColor.lightGray).cgColor)
    }
    
}
