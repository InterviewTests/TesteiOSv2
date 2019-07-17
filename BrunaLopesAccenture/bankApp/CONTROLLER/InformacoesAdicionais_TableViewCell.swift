//
//  InformacoesAdicionais_TableViewCell.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 12/07/19.

//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
//

import UIKit

class InformacoesAdicionais_TableViewCell: UITableViewCell {

    @IBOutlet weak var outTitulo: UILabel!
    
    @IBOutlet weak var outDescricao: UILabel!
    
    @IBOutlet weak var outData: UILabel!
    
    @IBOutlet weak var outValor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func relacionaLabelStruct (with ligacao: Extrato) {
    
    outTitulo.text = ligacao.titulo
    outDescricao.text = ligacao.descricao
    outData.text = ligacao.data
    outValor.text = "R$ \(ligacao.valor)"
        
    }
    
}
