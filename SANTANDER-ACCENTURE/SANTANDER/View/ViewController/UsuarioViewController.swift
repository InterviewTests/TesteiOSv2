//
//  UsuarioViewController.swift
//  SANTANDER
//
//  Created by Maíra Preto on 12/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import UIKit

class UsuarioViewController: UIViewController {

    
    @IBOutlet weak var usuarioTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usuarioTableView.register(UINib(nibName: "DadosUsuarioTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "DadosUsuarioTableViewCell")
        
        self.usuarioTableView.register(UINib(nibName: "LancamentosUsuarioTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "LancamentosUsuarioTableViewCell")
        
        self.usuarioTableView.delegate = self
        self.usuarioTableView.dataSource = self

        
    }
   
}

extension UsuarioViewController: UITableViewDelegate, UITableViewDataSource{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            
            if let lancamentosUsuarioCell = tableView.dequeueReusableCell(withIdentifier: "LancamentosUsuarioTableViewCell", for: indexPath) as? LancamentosUsuarioTableViewCell {
                return lancamentosUsuarioCell
            }
        } else {
            
            if let dadosUsuarioCell = tableView.dequeueReusableCell(withIdentifier: "DadosUsuarioTableViewCell", for: indexPath) as? DadosUsuarioTableViewCell {
                return dadosUsuarioCell
            }
        }
        return UITableViewCell()
        
        }
        
    
}


