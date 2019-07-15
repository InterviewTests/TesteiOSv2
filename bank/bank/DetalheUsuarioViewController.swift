//
//  DetalheUsuarioViewController.swift
//  bank
//
//  Created by mayara.da.s.andrade on 10/07/19.
//  Copyright © 2019 mayara.da.s.andrade. All rights reserved.
//

import UIKit

class DetalheUsuarioViewController: UIViewController {
    
    @IBOutlet weak var nome: UILabel!
    
    @IBOutlet weak var conta: UILabel!
    
    @IBOutlet weak var saldo: UILabel!
    
    var usuario : Usuario?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = usuario {
            nome.text = user.name
            self.conta.text = "ag: \(user.agencia) cc: \(user.conta)"
            self.saldo.text = "Saldo: \(user.saldo)"
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
