//
//  Lancamento_TableViewCell.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 10/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import UIKit

class Lancamento_TableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblValor: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        func prepare(with lancamento: Lancamento){
           lblTitle.text = lancamento.titulo
            lblDesc.text = lancamento.descricao
            lblData.text = lancamento.date
            lblValor.text = "R$ \(lancamento.valor)"
    }
}
