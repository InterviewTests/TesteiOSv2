//
//  ViewController.swift
//  Santander
//
//  Created by ely.assumpcao.ndiaye on 08/01/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Carregou")
        
        let parameters = [
            "user": "test_user",
            "password": "Test@1"
        ]
        
        AF.request("https://bank-app-test.herokuapp.com/api/login", method: .post, parameters: parameters, encoding:  URLEncoding.httpBody).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case.success(let data):
                print("success",data)
            case.failure(let error):
                print("Not Success",error)
            }
            
        }

    }

    @IBAction func loginPressed(_ sender: Any) {
        print("Abriu")
    }
    
}

