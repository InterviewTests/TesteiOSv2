//
//  LoginViewController.swift
//  Bank-app
//
//  Created by Leonardo Coutinho Santos on 15/09/19.
//  Copyright © 2019 Leocoout.dev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }
    
    // MARK: Actions
    @IBAction func didTapLoginButton(_ sender: Any) {
        let statements = StatementsViewController(nibName: "StatementsViewController", bundle: nil)
        navigationController?.pushViewController(statements, animated: true)
    }
    
    // MARK: Navigation
    private func setupNavigation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: Layout
    private func setupLayout() {
        
    }
    
}
