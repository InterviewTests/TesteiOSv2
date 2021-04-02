//
//  PasswordTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

class PasswordTableViewCell: UITableViewCell
{
      @IBOutlet var passwordTxT: UITextField!
      {
            didSet
            {
                  passwordTxT.placeholder = "   Senha    "
            }
      }
      
      override func awakeFromNib()
      {
            super.awakeFromNib()
            
            initAwakeFromNib()
      }
      
      override func prepareForReuse()
      {
            super.prepareForReuse()
      }
      
      override func setSelected(_ selected: Bool, animated: Bool)
      {
            super.setSelected(selected, animated: animated)
      }
      
      func initAwakeFromNib()
      {
            passwordTxT.layer.borderColor = uiColorGray.cgColor
            passwordTxT.layer.borderWidth = 1.0
            passwordTxT.layer.cornerRadius = 9
            passwordTxT.clipsToBounds = true
      }
      
}
