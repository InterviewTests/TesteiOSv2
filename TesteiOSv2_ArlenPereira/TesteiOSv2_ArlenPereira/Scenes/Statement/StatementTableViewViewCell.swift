//
//  StatementCollectionViewCell.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 28/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

import UIKit

class StatementTableViewViewCell: UITableViewCell {
    
    // MARK: Interface Cell
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: Life Cycle Cell
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Variables Cell
    var statementCell: StatementsModel.StatementsRequestModel.ViewModel.DisplayStatements? {
        didSet {
            if let title = statementCell?.title {
                titleLabel.text = title
            }
            
            if let date = statementCell?.date {
                dateLabel.text = date
            }
            
            if let description = statementCell?.desc {
                descriptionLabel.text = description
            }
            
            if let value = statementCell?.value {
                valueLabel.text = "R$ \(String(format:"%.2f", value))"
            }
        }
    }
}
