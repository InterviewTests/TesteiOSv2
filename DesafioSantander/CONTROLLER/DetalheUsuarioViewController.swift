//
//  DetalheUsuarioViewController.swift
//  DesafioSantander
//
//  Created by daianne.gomes.aguiar on 05/07/19.
//  Copyright © 2019 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

class DetalheUsuarioViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var extratoTableView: UITableView!
    

    
    @IBOutlet weak var saldo : UILabel!
    @IBOutlet weak var nome : UILabel!
    @IBOutlet weak var conta : UILabel!
    
    var usuario : Usuario?
   
    var componentes: Compomentes?
    let servico: LoginService = ConexaoAPI()
    var movimentacao: [Movimentacao] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = usuario {

            nome.text = user.name
            self.conta.text = "ag : \(user.agencia)   c/c: \(user.conta)"
            self.saldo.text = "\(user.saldo))"
            
            print("Entrou user verdadeiro")
            
            servico.conectMovimentacao(userId: user.userId){ Movimentacao in
                self.movimentacao = Movimentacao
                self.extratoTableView.reloadData()
                
            }
        }
        
        extratoTableView.delegate = self
        extratoTableView.dataSource = self

    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.movimentacao.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //variavel que replica as propriedades da celular de acordo com o meum indexPath
           let cell = extratoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Movimenta_TableViewCell

            //vatialvel que captura os valores do meu IndexPath
            let compo = movimentacao[indexPath.row]
            
            //variavel cell utiliza a funcao prepare que vincula as labels formatadas do auto layout

            cell.prepare(with: compo)

            return cell
        }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recentes"
    }
    
    //-----vincular esta funcao a imagem de logout-----
    @IBAction func btnSair(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
}
    

