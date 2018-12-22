//
//  AccountScreenView.swift
//  TesteiOSSantander
//
//  Created by julio.c.tanchiva on 12/19/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import UIKit

class AccountScreenView: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var reload: Bool = false
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var account: UILabel!
    @IBOutlet weak var labelAccount: UILabel!
    @IBOutlet weak var Balance: UILabel!
    @IBOutlet weak var labelBalance: UILabel!
    @IBOutlet weak var recent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        self.downloadInformations()
       
    }
    func initialSetup(){
        self.labelAccount.text = Labels.shared.conta
        self.labelBalance.text = Labels.shared.saldo
        self.recent.text = Labels.shared.Recente
        self.account.text = "\(dataUser.userAccount.agency)/\(dataUser.userAccount.bankAccount)"
        self.Balance.text = "R$\(dataUser.userAccount.balance)"
        self.name.text = dataUser.userAccount.name
    }
    func downloadInformations(){
        NetworkManager.shared.request_Statements {
            self.reload = true
            self.reloadDataFromModel()
        }
        
    }
   
    @IBAction func logout(_ sender: Any) {
        self.clearData()
        self.navigationController?.popViewController(animated: true)
    }
    func clearData(){
        dataStatements = nil
        dataUser = nil
    }
    
}

extension AccountScreenView: UITableViewDelegate, UITableViewDataSource {

    func reloadDataFromModel(_ refreshTable: Bool = true){

        if refreshTable{
            self.tableView.reloadData()
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if reload{
            return dataStatements.statementList.count
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! DetailsTableViewCell
        let data = dataStatements.statementList![indexPath.row]
        cell.data = data
        
        return cell
    }
    
}
