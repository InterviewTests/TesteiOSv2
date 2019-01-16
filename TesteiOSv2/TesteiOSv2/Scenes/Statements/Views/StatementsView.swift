//
//  Statements.swift
//  TesteiOSv2
//
//  Created by Silva, Alex Nunes da on 14/01/2019.
//  Copyright © 2019 Alex Nunes da Silva. All rights reserved.
//

import UIKit

class StatementsView: UIView {
    @IBOutlet private weak var viewContainer : UIView!
    @IBOutlet private weak var nameLabel : UILabel!
    @IBOutlet private weak var countAndAgency : UILabel!
    @IBOutlet private weak var balanceLabel : UILabel!


    override init(frame : CGRect){
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setUser(userAccount : UserAcount){
        if let name = userAccount.name{
             nameLabel.text = name
        }

        if let account = userAccount.bankAccount,
            let agency = userAccount.agency{
               countAndAgency.text =  "\(agency)/\(account)"
        }

        if let balance = userAccount.balance{
             balanceLabel.text = "\(balance)"
        }

    }
}



