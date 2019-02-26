//
//  LNSUserInfoView.swift
//  TesteiOSv2
//
//  Created by Capgemini on 24/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

protocol UserInfoViewDelegate {
    func logoutTapped()
}
class LNSUserInfoView: UIView {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAccountLabel: UILabel!
    @IBOutlet weak var userBalanceLabel: UILabel!
    
    var delegate : UserInfoViewDelegate?
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "LNSUserInfoView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! LNSUserInfoView
    }
    
    func setUserData(user: ListStatements.FetchStatements.ViewModel.UserDisplayed){
        userNameLabel.text = user.name
        userAccountLabel.text = user.account
        userBalanceLabel.text = user.balance
        
    }
    @IBAction func logoutTapped(_ sender: UIButton) {
        delegate?.logoutTapped()
    }
}
