//
//  LoginScreenView.swift
//  TesteiOSSantander
//
//  Created by julio.c.tanchiva on 12/19/18.
//  Copyright © 2018 julio.c.tanchiva. All rights reserved.
//

import Foundation
import UIKit

class LoginScreenView: UIViewController {
    var ultil = Util()
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextFild: UITextField!
    var passwordisValid = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func verifyPassword(_ sender: Any) {
        if ultil.verifyPassword(Password: passwordTextFild.text!){
            passwordisValid = true
        }
    }
    
    @IBAction func login(_ sender: Any) {
        
        if passwordisValid{
            NetworkManager.shared.request_User {
               self.navergar()
            }
        }
    }
    func navergar() {
        let escolha = self.storyboard?.instantiateViewController(withIdentifier: "accountDetails") as! AccountScreenView
        self.navigationController?.pushViewController(escolha, animated: true)
    }
    
    
}
