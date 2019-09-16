//
//  StatementsViewController.swift
//  Bank-app
//
//  Created by Leonardo Coutinho Santos on 15/09/19.
//  Copyright © 2019 Leocoout.dev. All rights reserved.
//

import UIKit
import Hero

class StatementsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var statementsHeader: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()

        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func setupLayout() {
        statementsHeader.hero.id = BankConstants.loginButtonId
    }
}
