//
//  LoginTableViewCell.swift
//  SANTANDER
//
//  Created by Maíra Preto on 11/02/20.
//  Copyright © 2020 Maíra Acioli. All rights reserved.
//

import UIKit

class LoginTableViewCell: UITableViewCell {

    
    @IBOutlet weak var logoBancoImageView: UIImageView!
    
    @IBOutlet weak var nomeUsuarioTextField: UITextField!{
        didSet{
            nomeUsuarioTextField.placeholder = "User"
        }
    }

    
    @IBOutlet weak var senhaUsuarioTextField: UITextField!{
        didSet{
            senhaUsuarioTextField.placeholder = "Password"
        }
    }
    
    
    @IBOutlet weak var loginButton: UIButton!{
    didSet{
        loginButton.backgroundColor = UIColor(red: 59/255, green: 73/255, blue: 238/255, alpha: 1)
        loginButton.layer.shadowColor = loginButton.backgroundColor?.cgColor
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        
        
//        if let menuVC = self.storyboard?.instantiateViewController(identifier: "UsuarioViewController") as? UsuarioViewController {
//            let nvc = UINavigationController(rootViewController: menuVC)
//            nvc.modalPresentationStyle = .fullScreen
//            self.present(nvc, animated: true, completion: nil)
//        }
              
    }
    
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func loginButton(_ sender: UIButton) {
    }
    
    
}
