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
    
    
    
    var controller: LoginController?
    let statement: StatementsController = StatementsController()
    var arrayWelcome: [StatementList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usuarioTableView.register(UINib(nibName: "DadosUsuarioTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "DadosUsuarioTableViewCell")
        
        self.usuarioTableView.register(UINib(nibName: "LancamentosUsuarioTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "LancamentosUsuarioTableViewCell")
        
        self.usuarioTableView.delegate = self
        self.usuarioTableView.dataSource = self
        
        self.controller = LoginController()
        self.controller?.delegate = self
        
        self.controller?.loadList()
        
        self.statement.delegate = self
        statement.loadList()
        
        
        
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
        
        return arrayWelcome.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            
            if let dadosUsuarioCell = tableView.dequeueReusableCell(withIdentifier: "DadosUsuarioTableViewCell", for: indexPath) as? DadosUsuarioTableViewCell {
                
                dadosUsuarioCell.delegate = self
               
//                    dadosUsuarioCell.setupCell(value: self.controller?.loadCurrentUser(indexPath: indexPath))
                
                return dadosUsuarioCell
            }
        } else {
            if let lancamentosUsuarioCell = tableView.dequeueReusableCell(withIdentifier: "LancamentosUsuarioTableViewCell", for: indexPath) as? LancamentosUsuarioTableViewCell {
                
                lancamentosUsuarioCell.set(list: arrayWelcome[indexPath.row])
               
                
                return lancamentosUsuarioCell
            }
        }
        return UITableViewCell()
        
    }
    
    
}



extension UsuarioViewController: UserControllerDelegate{
    
    func successLoadUsers() {
        self.usuarioTableView.reloadData()
    }
    
    func errorLoadUsers(error: Error?) {
        
    }
    
    
    
}

extension UsuarioViewController: StatementsControllerProtocol {
    func didFinishRequest(array: [StatementList]) {
        arrayWelcome = array
        self.usuarioTableView.reloadData()
    }
}

extension UsuarioViewController: LogoutBtnDelegate{

    func logoutBtnTapped() {
        self.dismiss(animated: true, completion: nil)
//
//        let vc = storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController ?? UIViewController()
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)

}
}

