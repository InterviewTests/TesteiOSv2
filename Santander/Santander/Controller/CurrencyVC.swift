//
//  CurrencyVC.swift
//  Santander
//
//  Created by ely.assumpcao.ndiaye on 08/01/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class CurrencyVC: UIViewController {

    @IBOutlet weak var nameUserLbl: UILabel!
    @IBOutlet weak var userAccountLbl: UILabel!
    @IBOutlet weak var userBalance: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Currency", AuthService.instance.userName)
        nameUserLbl.text = AuthService.instance.userName
        userAccountLbl.text = AuthService.instance.userBankAccount + " / " + AuthService.instance.userAgency
        userBalance.text = "R$" + AuthService.instance.userBalance
        
    }
    

    @IBAction func btnLogoutPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
