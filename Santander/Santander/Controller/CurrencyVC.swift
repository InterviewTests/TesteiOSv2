//
//  CurrencyVC.swift
//  Santander
//
//  Created by ely.assumpcao.ndiaye on 08/01/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class CurrencyVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tblJson: UITableView!
    
    
    @IBOutlet weak var nameUserLbl: UILabel!
    @IBOutlet weak var userAccountLbl: UILabel!
    @IBOutlet weak var userBalance: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("Cliente", AuthService.instance.userName)
        nameUserLbl.text = AuthService.instance.userName
        userAccountLbl.text = AuthService.instance.userBankAccount + " / " + AuthService.instance.userAgency
        userBalance.text = "R$" + AuthService.instance.userBalance
        
        
        tblJson.delegate = self
        tblJson.dataSource = self
        
    }// View Did Load
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "jsonCell", for: indexPath) as? JsonCell{
            let statement = StatementService.instance.statements[indexPath.row]
            cell.configureCell(statement: statement)
            return cell
        }else {
            return UITableViewCell()
        }
    }// Func table
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StatementService.instance.statements.count
    }
    
    
    
    @IBAction func btnLogoutPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
