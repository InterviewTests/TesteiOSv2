//
//  ExtratoTableViewCell.swift
//  BankApp
//
//  Created by Victor Lisboa on 19/09/19.
//  Copyright © 2019 Victor Lisboa. All rights reserved.
//

import UIKit

class ExtratoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor.white
        self.mainView.clipsToBounds = true
        self.mainView.layer.masksToBounds = false
        self.mainView.layer.cornerRadius = 5
        self.mainView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.mainView.layer.shadowRadius = 2
        self.mainView.layer.shadowOpacity = 0.25
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
