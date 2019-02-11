//
//  HomeTableViewCell.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var label_date: UILabel!
    @IBOutlet weak var label_type: UILabel!
    @IBOutlet weak var label_price: UILabel!
    
    @IBOutlet weak var view_container: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    self.view_container.addShadow(color: .ShadowCellColor, opacity: 1.0, offSetWidth: 1, offSetHeight: 1, radius: 1)
        self.view_container.addBorder()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(){
        self.selectionStyle = .none
        self.label_date.text = "date"
        self.label_price.text = "price"
        self.label_type.text = "type"
    }
    
}
