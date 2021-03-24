//
//  LoginTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

protocol LoginTableViewCellDelegate
{
      func loginTableViewCellAction()
}

class LoginTableViewCell: UITableViewCell
{
      
      var delegate: LoginTableViewCellDelegate?
      
      @IBOutlet var loginBtN: UIButton!
      
      override func awakeFromNib()
      {
            super.awakeFromNib()
            
            initAwakeFromNib()
      }
      
      override func setSelected(_ selected: Bool, animated: Bool)
      {
            super.setSelected(selected, animated: animated)
      }
      
      func initAwakeFromNib()
      {
            loginBtN.layer.cornerRadius = 9
            loginBtN.clipsToBounds = true
      }
      
      @IBAction func loginTableViewCellAction(_ sender: UIButton)
      {
            if let delegate = self.delegate
            {
                  delegate.loginTableViewCellAction()
            }
      }
      
}
