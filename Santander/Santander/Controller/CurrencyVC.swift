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
    
    var statements = [StatementList]()
    var arrRes = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("Cliente", AuthService.instance.userName)
        nameUserLbl.text = AuthService.instance.userName
        userAccountLbl.text = AuthService.instance.userBankAccount + " / " + AuthService.instance.userAgency
        userBalance.text = "R$" + AuthService.instance.userBalance
        
        StatementService.instance.findAllChannel { (sucess) in
            
        }
        
    }// View Did Load
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")! as! JsonCell
        var dict = arrRes[(indexPath as NSIndexPath).row]
        cell.title.text = dict["title"] as? String
        cell.desc.text = dict["desc"] as? String
        cell.data.text = dict["date"] as? String
        cell.value.text = dict["value"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    
    
    @IBAction func btnLogoutPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
