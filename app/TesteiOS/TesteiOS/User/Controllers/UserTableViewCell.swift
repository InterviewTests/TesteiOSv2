//
//  UserTableViewCell.swift
//  TesteiOS
//
//  Created by Emerson Pereira on 15/01/2019.
//  Copyright © 2019 doug. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet private weak var cellView: UIView!
    
    @IBOutlet private weak var statementTypeLabel: UILabel!
    @IBOutlet private weak var statementDateLabel: UILabel!
    @IBOutlet private weak var statementNameLabel: UILabel!
    @IBOutlet private weak var statementValueLabel: UILabel!
    
    var statementType: String! {
        didSet {
            self.statementTypeLabel.text = statementType
        }
    }
    
    var statementDate: String! {
        didSet {
            statementDateLabel.text = statementDate
        }
    }
    
    var statementName: String! {
        didSet {
            statementNameLabel.text = statementName
        }
    }
    
    var statementValue: String! {
        didSet {
            statementValueLabel.text = statementValue
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setCellView()
    }
    
}

extension UserTableViewCell {
    func setCellView() {
        cellView.layer.cornerRadius = 2.0
        cellView.clipsToBounds = true
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowOpacity = 0.7
        cellView.layer.shadowOffset = CGSize.zero
        cellView.layer.shadowRadius = 50
        cellView.layer.shadowPath = UIBezierPath(rect: cellView.bounds).cgPath
        cellView.layer.shouldRasterize = true
    }
}
