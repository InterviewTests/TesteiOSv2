//
//  ViewController.swift
//  SANTANDER
//
//  Created by Maíra Preto on 11/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController, SomeUIViewDelegate {
    
    func loginBtnTapped(name: String, passwd: String) {
        
    }
    
    @IBOutlet weak var loginTableView: UITableView!
    
    var login = LoginTableViewCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.loginTableView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: "LoginTableViewCell")
        
        self.loginTableView.delegate = self
        self.loginTableView.dataSource = self
        
        loginTableView.delegate = self
        loginTableView.reloadData()
        
       
        
    }

    func segueFunction() {
        
//        self.performSegue(withIdentifier: "SegueLoginUsuario", sender: self)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "UsuarioViewController") as! UsuarioViewController

        self.present(resultViewController, animated:true, completion:nil)
    }
    
}



extension LoginViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let receberCell = tableView.dequeueReusableCell(withIdentifier: "LoginTableViewCell", for: indexPath) as? LoginTableViewCell {
            
            receberCell.delegateSegue = self
           
//            receberCell.layer.borderColor = UIColor.label.cgColor
            
                   
                   return receberCell
               }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return tableView.frame.height
       }
  
    
}
   
    

extension LoginViewController: UserControllerDelegate{
    
    func successLoadUsers() {
        self.loginTableView.reloadData()
    }
    
    func errorLoadUsers(error: Error?) {
        
    }
    
    
    
    
}
