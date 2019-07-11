//
//  DadosViewController.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 05/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import UIKit

class DadosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblAgConta: UILabel!
    @IBOutlet weak var lblSaldo: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func btnSair(_ sender: UIButton) {
        sair()
    }
   
    var usuario: Usuario?
    let api = BancoAPI()
    var lancamentos: [Lancamento]?
    
    func sair(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = usuario {
            lblNome.text = user.name
            self.lblAgConta.text = " \(user.agencia) / \(user.conta)"
            self.lblSaldo.text = "R$ \(user.saldo)"
            
            api.buscaLancamentos(userID: user.userId){ lancamentos in
                print(lancamentos)
                self.lancamentos = lancamentos
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
            
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lancamentos!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as? Lancamento_TableViewCell{
            
            
            
            cell.prepare(with: lancamentos![indexPath.row])
        return cell
        }
        else{
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recentes"
    }
    

}
