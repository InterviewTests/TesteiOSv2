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
    
     var statements = [Statement]()
     var arrRes = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Cliente", AuthService.instance.userName)
        nameUserLbl.text = AuthService.instance.userName
        userAccountLbl.text = AuthService.instance.userBankAccount + " / " + AuthService.instance.userAgency
        userBalance.text = "R$" + AuthService.instance.userBalance
        
        
        AF.request(URL_STATEMENTS, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }

                let swiftyJsonVar = JSON(response.result.value!)
                //print(swiftyJsonVar)
                
                if let resData = swiftyJsonVar["statementList"].arrayObject {
                    print(resData)
                    self.arrRes = resData as! [[String:AnyObject]]
                    print(self.arrRes)
                }
                if self.arrRes.count > 0 {
                    print("entrou")
                    self.tblJson.reloadData()
                }
                
                
            } else {
                print(response.result.error as Any)
                debugPrint(response.result.error as Any)
            }
        
        }
    }// View Did Load
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
        var dict = arrRes[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = dict["title"] as? String
        cell.detailTextLabel?.text = dict["desc"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
   
    

    @IBAction func btnLogoutPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
