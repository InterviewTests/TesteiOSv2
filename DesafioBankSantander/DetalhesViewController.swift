//
//  DetallhesViewController.swift
//  DesafioBankSantander
//
//  Created by fabiana.c.almeida on 7/14/19.
//  Copyright © 2019 b. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    
    @IBOutlet weak var lbnome: UILabel!
    @IBOutlet weak var lbconta: UILabel!
    @IBOutlet weak var lbsaldo: UILabel!
    @IBOutlet weak var tbView: UITableView!
    
    
    var cliente:  Cliente?
    var lacamento: [Movimentacoes]? //Armazenar a Lista de lancamento
    var ArmazenaAPI = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = cliente {
            lbnome.text = user.name
            self.lbconta.text = " ag: \(user.agencia) cc: \(user.conta)"
            self.lbsaldo.text = "Saldo: \(user.saldo)"
            ArmazenaAPI.requestLancamento(userId: user.userId) { response in
                self.lacamento = response
                self.tbView.delegate = self
                self.tbView.dataSource = self
                self.tbView.reloadData()
                }            
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lacamento!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let chamacell = tableView.dequeueReusableCell(withIdentifier: "extrato", for: indexPath) as? ExtratoTableViewCell{
            chamacell.prepare(with: lacamento![indexPath.row])
            return chamacell 
        }
        else{
            fatalError()
        }
    }
}
