//
//  StatementTableViewCell.swift
//  BankApp
//
//  Created by Bruno Maciel on 1/16/21.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    @IBOutlet weak var view_card: UIView!
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var lb_description: UILabel!
    @IBOutlet weak var lb_date: UILabel!
    @IBOutlet weak var lb_value: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        view_card.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
