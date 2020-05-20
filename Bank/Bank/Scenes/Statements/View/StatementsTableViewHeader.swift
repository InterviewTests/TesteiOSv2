//
//  BillSuccessTableViewHeader.swift
//  PSMyAccount
//
//  Created by Roberth on 06/05/19.
//  Copyright © 2019 PagSeguro. All rights reserved.
//

import UIKit

class StatementsTableViewHeader: UIView {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    func setUer(userLogin: UserLogin) {
        nameLabel.text = userLogin.userAccount?.name
    }
}
