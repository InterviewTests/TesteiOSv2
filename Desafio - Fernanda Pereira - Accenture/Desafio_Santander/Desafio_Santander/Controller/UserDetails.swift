//
//  UserDetails.swift
//  Desafio_Santander
//
//  Created by fernanda.pereira on 10/07/19.
//  Copyright © 2019 fernanda.pereira. All rights reserved.
//

import UIKit

class UserDetails: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    
  
    
    
    @IBOutlet weak var lblNomeUser: UILabel!
    @IBOutlet weak var lblAgenciaConta: UILabel!
    @IBOutlet weak var lblSaldo: UILabel!
    @IBOutlet weak var tvUserStatement: UITableView!
 
    @IBAction func btnGoBack(_ sender: Any) {
        goBack()
    }
    var userDetails: Usuario?
    var userStatement: Transactions?
//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvUserStatement.delegate = self
        tvUserStatement.dataSource = self
        
        if let user = userDetails {
            lblNomeUser.text = user.name
            self.lblAgenciaConta.text = "\(user.agencia)/\(user.conta)"
            self.lblSaldo.text = "R$\(user.saldo)"
        }
        
    }
    func tableView(_ tableViewStatement: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statementCell = tableViewStatement.dequeueReusableCell(withIdentifier: "SCell", for: indexPath) as! tableViewCell
//        statementCell.prepareOutlets(with: Transactions)
//        statementCell.prepareOutlets(with: userStatement!)

        return statementCell
    }

    func tableView(_ tvUserStatement: UITableView, titleForHeaderInSection section: Int) -> String {
        let title = "Recentes"
        return title
    }
    func tableView(_ tvUserStatement: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numbersOfSectionInTableView(tvUserStatement: UITableView) -> Int {
        return 1
    }

    
    
    func goBack(){
        navigationController?
            .popViewController(animated: true)
    }
    }

    

