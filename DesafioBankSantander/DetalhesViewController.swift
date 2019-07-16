//
//  DetallhesViewController.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/14/19.
//  Copyright © 2019 b. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    
    
    @IBOutlet weak var lbnome: UILabel!
    @IBOutlet weak var lbconta: UILabel!
    @IBOutlet weak var lbsaldo: UILabel!

    
    var cliente:  Cliente?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = cliente {
            lbnome.text = user.name
            self.lbconta.text = " ag: \(user.agencia) cc: \(user.conta)"
            self.lbsaldo.text = "Saldo: \(user.saldo)"
            
        }
    }
}
