//
//  StatementTableViewCell.swift
//  TesteiOSv2
//
//  Created by Bruno on 10/11/18.
//  Copyright © 2018 Bruno Scheltzke. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with statementInfo: StatementList.Fetch.ViewModel.StatementInfo) {
        titleLabel.text = statementInfo.title
        descriptionLabel.text = statementInfo.detail
        dateLabel.text = statementInfo.date
        valueLabel.text = statementInfo.value
    }
}
