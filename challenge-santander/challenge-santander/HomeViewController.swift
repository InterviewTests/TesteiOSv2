//
//  HomeViewController.swift
//  santander-interview
//
//  Created by Hugo Ferreira on 16/05/20.
//  Copyright © 2020 Hugo Ferreira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logoutPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
