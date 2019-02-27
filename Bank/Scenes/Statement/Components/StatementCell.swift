//
//  StatementCell.swift
//  Bank
//
//  Created by Administrador on 27/02/2019.
//  Copyright © 2019 Bank Co. All rights reserved.
//

import UIKit

class StatementCell: UICollectionViewCell {
    @IBOutlet var viewCell: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesc: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblValue: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView() {
        self.viewCell.layer.cornerRadius = 6
        self.viewCell.layer.borderColor = UIColor.init(red: 0.8588, green: 0.8745, blue: 0.8902, alpha: 0.3).cgColor
        self.viewCell.layer.borderWidth = 1.0
        self.viewCell.layer.shadowColor = UIColor.init(red: 0.8510, green: 0.8863, blue: 0.9137, alpha: 0.5).cgColor
        self.viewCell.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.viewCell.layer.shadowOpacity = 0.5
        self.viewCell.layer.shadowRadius = 5
    }
    
    func loadData(item: StatementView.ViewModel.DisplayedStatementItem?) {
        if let info = item {
            lblTitle.text = info.title
            lblDesc.text = info.desc
            lblDate.text = info.date
            lblValue.text = info.value
        }
        else
        {
            lblTitle.text = ""
            lblDesc.text = ""
            lblDate.text = ""
            lblValue.text = ""
        }
    }
}
