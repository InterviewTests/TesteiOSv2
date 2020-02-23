//
//  DadosClienteTableViewCell.swift
//  SANTANDER
//
//  Created by Maíra Preto on 11/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import UIKit

class DadosUsuarioTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nomeLabel: UILabel!
    
    @IBOutlet weak var dadosContaLabel: UILabel!
    
    @IBOutlet weak var saldoLabel: UILabel!
    

       
       override func awakeFromNib() {
           super.awakeFromNib()
       }
       
//
//
       
    
    @IBAction func logoutButton(_ sender: UIButton) {
        
    }
}
