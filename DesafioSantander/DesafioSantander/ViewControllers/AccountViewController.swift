//
//  AccountViewController.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 28/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func logoutAction(_ sender: Any) {
        print("LOGOUT")
    }
}
