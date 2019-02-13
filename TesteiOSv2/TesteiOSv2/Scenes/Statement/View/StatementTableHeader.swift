//
//  StatementTableHeader.swift
//  TesteiOSv2
//
//  Created by jeffersoncsilva on 08/02/2019.
//  Copyright © 2019 Accenture. All rights reserved.
//

import UIKit

//MARK: - Protocol's
protocol StatementTableHeaderProtocol {
   func didLogOut()
}

//MARK: - Class Body
class StatementTableHeader: UIView {
    
    //MARK: - Properties
    var delagete: StatementTableHeaderProtocol?

    //MARK: - IBOutlets
    @IBOutlet weak var label_user_name: UILabel!
    @IBOutlet weak var label_account_number: UILabel!
    @IBOutlet weak var label_balance: UILabel!
    
    //MARK: - IBActions
    @IBAction func didTouchLogOutButton(_ sender: Any) {
        if let delegate = self.delagete{
            delegate.didLogOut()
        }
    }
    
    //MARK: - Functions
    func populateFields(user: User) {
       
        if let userName = user.name{
            self.label_user_name.text = userName
        }
        
        if let agency = user.agency, let bankAccount = user.bankAccount{
            self.label_account_number.text = "\(bankAccount) / \(agency)"
        }
        
        if let balance = user.balance{
            self.label_balance.text = "\(balance.convertCoin())"
        }
        
    }
}
