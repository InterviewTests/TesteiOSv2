//
//  ExtratoTableViewCell.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/16/19.
//  Copyright © 2019 b. All rights reserved.
//

import UIKit

class ExtratoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var lbValue: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbDesc: UILabel!
    
    func prepare (with extrato: Movimentacoes) {
        //funcao p/ preparar label (atribuir valores)
        lbTitulo.text = extrato.title
        lbValue.text = "\(extrato.value)" //converte qualquer var p/ String
        lbDate.text = extrato.date
        lbDesc.text = extrato.desc
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
