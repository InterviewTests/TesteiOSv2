//
//  AccountDetailsCell.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import UIKit

protocol LogoutBtnDelegate: class {
    func logoutBtnTapped()
}

class AccountDetailsCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountDataLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    

    weak var delegate: LogoutBtnDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(account: UserAccount) {
        self.nameLabel.text = account.name
        
        if let agency = account.agency, let bank = account.bankAccount {
            self.accountDataLabel.text = "\(agency)\\\(bank)"
        }
        self.balanceLabel.text = formatLabel(value: account.balance ?? 0.00)
    }
    
    
    @IBAction func logoutTapped(_ sender: Any) {
        delegate?.logoutBtnTapped()
    }
    
    func formatLabel(value: Float) -> String{
        if value < Float(0.0) {
            let val = String(format: "R$%.02f", value)
            return val
        } else {
            var val = String(format: "-R$%.02f", value)
            val = val.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
            return val
        }
    }
}
