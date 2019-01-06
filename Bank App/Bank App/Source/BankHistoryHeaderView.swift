//
//  BankHistoryHeaderView.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 05/01/2019.
//  Copyright © 2019 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit

class BankHistoryHeaderView: UIView {
    
    @IBOutlet weak var lbUserName: UILabel!
    @IBOutlet weak var lbUserAccountNumber: UILabel!
    @IBOutlet weak var lbUserBalance: UILabel!
    
    var user: UserAccountData?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(_ user: UserAccountData) {
        lbUserName.text = user.userAccount?.name
        
        if let _balance = user.userAccount?.balance {
            lbUserBalance.text = "R$\(_balance)"
        }
        
        if let agency = user.userAccount?.agency, let bankAccount = user.userAccount?.bankAccount {
            lbUserAccountNumber.text = "\(bankAccount) / \(agency)"
        }
    }
}
