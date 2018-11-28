//
//  PaymentCellTableViewCell.swift
//  TesteSantander
//
//  Created by Henrique Pereira de Lima on 26/11/18.
//  Copyright © 2018 Henrique Pereira de Lima. All rights reserved.
//

import UIKit

class PaymentTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTransaction : UILabel!
    @IBOutlet weak var lblTransactionDate : UILabel!
    @IBOutlet weak var lblTransactionTitle : UILabel!
    @IBOutlet weak var lblPrice : UILabel!
    @IBOutlet weak var viewTransaction : UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewTransaction.layer.cornerRadius = 5
        self.viewTransaction.layer.shadowColor = UIColor.lightGray.cgColor
        self.viewTransaction.layer.shadowOpacity = 0.8
        self.viewTransaction.layer.shadowOffset = CGSize(width: 2, height: 2)
        // Initialization code
    }
    
    func setTransaction(_ transaction:Transaction) {
        self.lblTransaction.text = transaction.desc
        self.lblTransactionTitle.text = transaction.title
        self.lblPrice.text = String(format: "R$ %.2f", transaction.value).replacingOccurrences(of: ".", with: ",")
        self.lblTransactionDate.text = transaction.date
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
