//
//  AccountStatmentsCell.swift
//  cleanSwiftProject
//
//  Created by santosw ios samel on 03/05/21.
//

import UIKit

class AccountStatmentsCell: UITableViewCell {
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var descriptionLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var valueLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
