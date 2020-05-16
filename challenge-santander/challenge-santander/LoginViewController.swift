//
//  ViewController.swift
//  santander-interview
//
//  Created by Hugo Ferreira on 16/05/20.
//  Copyright © 2020 Hugo Ferreira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonLoginPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHome" {
            let destinationVC = segue.destination as! HomeViewController
        }
    }


}

