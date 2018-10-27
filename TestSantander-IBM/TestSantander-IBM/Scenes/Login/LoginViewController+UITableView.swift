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
            loginCell.setupDefaultValuesOnDismiss()
            loginCell.userTextField.text = user
            return loginCell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
}

extension LoginViewController: PerformLoginDelegate{
    func handleError(_ err: String?, request: LoginScene.PostLogin.Request) {
        let alert = UIAlertController(title: "Ops", message: err, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.dismiss(animated: false, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
        
    func loginBtnTapped(name: String, passwd: String) {
        let request = LoginScene.PostLogin.Request(user: name, password: passwd)
        loadingAlert()
        performLogin(request: request)
    }
    
    func performLogin(request: LoginScene.PostLogin.Request){
        output?.postLogin(request: request, completionHandler: { (succeed, err) in
            if succeed {
                DispatchQueue.main.async {
                    self.dismiss(animated: false, completion: {
                        self.router?.navigateToUserDetailScene()
                    })
                }
            } else {
                DispatchQueue.main.async {
                    self.dismiss(animated: false, completion: {
                        self.handleError(err, request: request)
                    })
                }
            }
        })
    }
}
