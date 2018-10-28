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
            self.accountDataLabel.text = "\(agency)/\(bank)"
        }
        self.balanceLabel.text = String.formatCurrencyLabel(value: account.balance ?? 0.00)
    }
    
    
    @IBAction func logoutTapped(_ sender: Any) {
        delegate?.logoutBtnTapped()
    }
}
