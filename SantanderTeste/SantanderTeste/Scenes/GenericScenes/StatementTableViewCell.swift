//
//  StatementTableViewCell.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 18/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descritpion: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var viewShadow: UIView!
    
    var viewModel: StatementViewModels.Statement.ViewModel? {
        didSet {
            didSetViewModel()
            setupView()
        }
    }
    func didSetViewModel(){
        guard let viewModel = viewModel else { return }
        title.text = viewModel.title
        descritpion.text = viewModel.description
        date.text = viewModel.date.formatStringDate()
        value.text = viewModel.value
    }
    
    func setupView(){
        self.viewShadow.applyShadow()
    }
}
