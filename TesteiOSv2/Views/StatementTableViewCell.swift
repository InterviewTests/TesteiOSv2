//
//  StatementTableViewCell.swift
//  TesteiOSv2
//
//  Created by Capgemini on 24/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    var statement : ListStatements.FetchStatements.ViewModel.StatementDisplayed? {
        didSet {
            self.setStatement(statement)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setStatement(_ s : ListStatements.FetchStatements.ViewModel.StatementDisplayed?){
        if let statement = s {
            titleLabel.text = statement.title
            descriptionLabel.text = statement.desc
            dateLabel.text = statement.date
            valueLabel.text = statement.value
        }
        
        
    }
    

}
