//
//  LoginViewController+UITableView.swift
//  TestSantander-IBM
//
//  Created by Erika Albizzati on 26/10/18.
//  Copyright © 2018 Erika Albizzati. All rights reserved.
//

import UIKit

extension LoginViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureTableViewOnLoad() {
        tableView.register(UINib(nibName: "LoginCell", bundle: Bundle.main), forCellReuseIdentifier: cellIdentifiers.loginCell)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let loginCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.loginCell) as? LoginCell{
            loginCell.delegate = self
            
            guard let user = userFromUserDefaults?.userName else {
                return loginCell
            }
            loginCell.userValid = true
            loginCell.userTextField.placeholder = nil
            loginCell.userTextField.text = user
            loginCell.passwordTextField.placeholder = "Password"
            loginCell.passwordTextField.text = ""
            
            return loginCell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
}

extension LoginViewController: PerformLoginDelegate{
    func loginBtnTapped(name: String, passwd: String) {
//        let request = LoginScene.PostLogin.Request(user: name, password: passwd)
//        
//        //deveria encapsular esse metodo
//        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
//        
//        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
//        loadingIndicator.hidesWhenStopped = true
//        loadingIndicator.style = UIActivityIndicatorView.Style.gray
//        loadingIndicator.startAnimating();
//        
//        alert.view.addSubview(loadingIndicator)
//        present(alert, animated: true, completion: nil)
//        
//        output?.postLogin(request: request, completionHandler: { (succeed) in
//            if succeed {
//                DispatchQueue.main.async {
//                    self.dismiss(animated: false, completion: nil)
//                    self.router?.navigateToUserDetailScene()
//                }
//            }
//        })
    }
}

