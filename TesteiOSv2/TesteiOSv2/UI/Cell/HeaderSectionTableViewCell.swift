//
//  HeaderSectionTableViewCell.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

class HeaderSectionTableViewCell: UITableViewCell {
    static let identifier: String = "HeaderSectionTableViewCell"
    
    static var cellHeight: CGFloat {
        return 50
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
