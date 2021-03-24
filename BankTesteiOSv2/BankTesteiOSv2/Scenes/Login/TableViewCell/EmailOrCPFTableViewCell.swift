//
//  EmailOrCPFTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

class EmailOrCPFTableViewCell: UITableViewCell
{
      
      @IBOutlet var emailOrCPFTxTF: UITextField!
      
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
            emailOrCPFTxTF.layer.borderColor = uiColorGray.cgColor
            emailOrCPFTxTF.layer.borderWidth = 1.0
            emailOrCPFTxTF.layer.cornerRadius = 9
            emailOrCPFTxTF.clipsToBounds = true
      }
      
}
