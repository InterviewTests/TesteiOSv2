//
//  TotalStatementTableViewCell.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit

protocol TotalStatementTableViewCellDelegate
{
      func logoutTotalStatementTableViewCellAction()
}


class TotalStatementTableViewCell: UITableViewCell
{

      var delegate: TotalStatementTableViewCellDelegate?

      @IBOutlet var nameLbL: UILabel!
      
      @IBOutlet var logoutBtN: UIButton!
      
      @IBOutlet var accountTitleLbL: UILabel!
      @IBOutlet var accountNumberLbL: UILabel!
      
      @IBOutlet var balanceTitleLbL: UILabel!
      @IBOutlet var balanceLbL: UILabel!
      
      override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
      
      @IBAction func logoutTotalStatementTableViewCellAction(_ sender: UIButton)
      {
            if let delegate = self.delegate
            {
                  delegate.logoutTotalStatementTableViewCellAction()
            }
      }
    
}
