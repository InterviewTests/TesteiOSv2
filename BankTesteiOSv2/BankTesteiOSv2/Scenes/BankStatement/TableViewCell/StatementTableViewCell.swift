//
//  StatementTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

class StatementTableViewCell: UITableViewCell
{
      
      @IBOutlet var statementV: UIView!
      
      @IBOutlet var titleLbL: UILabel!
      @IBOutlet var dateLbL: UILabel!
      @IBOutlet var descriptionLbL: UILabel!
      @IBOutlet var valueLbL: UILabel!
      
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
            statementV.layer.shadowColor = uiColorLightGray.cgColor
            statementV.layer.shadowOpacity = 1
            statementV.layer.shadowOffset = .zero
            statementV.layer.shadowRadius = 9
      }
      
}
