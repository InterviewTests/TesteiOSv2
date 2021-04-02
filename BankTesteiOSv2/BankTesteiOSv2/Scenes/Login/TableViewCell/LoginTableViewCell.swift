//
//  LoginTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

class LoginTableViewCell: UITableViewCell
{
            
      @IBOutlet var loginBtN: UIButton!
      {
            didSet
            {
                  loginBtN.layer.cornerRadius = 9
                  loginBtN.clipsToBounds = true
            }
      }
      
      override func awakeFromNib()
      {
            super.awakeFromNib()
      }
      
      override func setSelected(_ selected: Bool, animated: Bool)
      {
            super.setSelected(selected, animated: animated)
      }

}
