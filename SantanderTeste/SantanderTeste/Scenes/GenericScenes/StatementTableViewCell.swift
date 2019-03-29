//
//  StatementTableViewCell.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 18/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descritpionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var viewShadow: UIView!
    
    var viewModel: StatementViewModels.Statement.ViewModel? {
        didSet {
            didSetViewModel()
            setupView()
        }
    }
    func didSetViewModel(){
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.title
        descritpionLabel.text = viewModel.description
        dateLabel.text = viewModel.date.formatStringDate()
        valueLabel.text = viewModel.value
    }
    
    func setupView(){
        self.viewShadow.applyShadow()
    }
}
