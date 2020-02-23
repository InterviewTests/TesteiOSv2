//
//  LancamentosUsuarioTableViewCell.swift
//  SANTANDER
//
//  Created by Maíra Preto on 11/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import UIKit

class LancamentosUsuarioTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tituloLabel: UILabel!
    
    @IBOutlet weak var descricaoLabel: UILabel!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var valorLabel: UILabel!
    
    @IBOutlet weak var celulaView: UIView!
    
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
        celulaView.layer.shadowColor = UIColor.lightGray.cgColor
        celulaView.layer.shadowOffset = CGSize(width: 2, height: 2)
        celulaView.layer.shadowOpacity = 0.5
        celulaView.layer.shadowRadius = 5
       }
       
//       func set(statement: StatementListScene.GetStatements.ViewModel.Statements) {
//           self.tituloLabel.text = statement.title
//           self.descricaoLabel.text = statement.description
//           self.dataLabel.text = String.dateFromCustomString(customString: statement.date)
//
//           if statement.value < 0 {
//               valorLabel.textColor = UIColor.red
//           } else {
//               valorLabel.textColor = UIColor.darkGray
//           }
//
//           valorLabel.text = String.formatCurrencyLabel(value: statement.value)
//       }
}
