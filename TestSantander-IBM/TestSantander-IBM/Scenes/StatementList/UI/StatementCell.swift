//
//  StatementCell.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import UIKit

class StatementCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.shadowColor = UIColor.lightGray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 2, height: 2 )
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowRadius = 5
    }
    
    func set(statement: StatementListScene.GetStatements.ViewModel.Statements) {
        self.titleLabel.text = statement.title
        self.descriptionLabel.text = statement.description
        self.dateLabel.text = statement.date
        
        valueLabel.text = formatLabel(value: statement.value)
    }
    
    func formatLabel(value: Float) -> String{
        var value = String(format: "R$%.02f", value)
        //nao mostra o sinal do layout do teste.
        value = value.replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        return value
    }
}
