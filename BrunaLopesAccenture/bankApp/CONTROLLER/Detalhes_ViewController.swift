//
//  Detalhes_ViewController.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 10/07/19.
//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
//

import UIKit

class Detalhes_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var usuario: Usuario?
    
    @IBOutlet weak var outNome: UILabel!
    
    @IBOutlet weak var outConta: UILabel!
    
    @IBOutlet weak var outSaldo: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func atcSair(_ sender: UIButton) {
        vaiParaPrincipal()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = usuario {
            outNome.text = user.name
            self.outConta.text = "\(user.conta) / \(user.agencia)"
            self.outSaldo.text = "R$ \(user.saldo)"
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! InformacoesAdicionais_TableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       let titulo = "Recentes"
       return titulo
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func vaiParaPrincipal(){
        navigationController?.popViewController(animated: true)
    }
}

