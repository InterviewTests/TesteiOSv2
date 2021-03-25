//
//  ViewController.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController
{
      
      var loginTableViewCell : LoginTableViewCell?
      var emailOrCPFTableViewCell : EmailOrCPFTableViewCell?
      var passwordTableViewCell : PasswordTableViewCell?
                        
      var loginViewModel = LoginViewModel()
            
      var loginTableView: UITableView!
      {
            didSet
            {
                  loginTableView.delegate = self
                  loginTableView.dataSource = self
                  
                  loginTableView.tableFooterView = UIView(frame: CGRect.zero)
                  loginTableView.tag = 101
                  
                  view.addSubview(loginTableView)
            }
      }
      
      override func viewDidLoad()
      {
            super.viewDidLoad()
            
            initViewDidLoad()
            registerCells()
      }
      
      override func viewWillLayoutSubviews()
      {
            super.viewWillLayoutSubviews()
            
            loginTableView.frame = view.bounds
      }
      
      override func viewWillDisappear(_ animated: Bool)
      {
            super.viewWillDisappear(true)
      }
      
      func initViewDidLoad()
      {
            loginTableView = UITableView(frame: CGRect.zero, style: .grouped)
            loginTableView.separatorStyle = .none
            loginTableView.allowsSelection = false
            loginTableView.backgroundColor = uiColorWhite
      }
      
      func registerCells()
      {
            self.loginTableView.register(UINib(nibName: "LogoTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.LogoTableViewCell.rawValue)
            
            self.loginTableView.register(UINib(nibName: "EmailOrCPFTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.EmailOrCPFTableViewCell.rawValue)
            self.loginTableView.register(UINib(nibName: "PasswordTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.PasswordTableViewCell.rawValue)
            
            self.loginTableView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.LoginTableViewCell.rawValue)
      }
      
      func bankStatementAction()
      {
            let storyboard = UIStoryboard(name: "BankStatement", bundle: nil)
            let bankStatementVC = storyboard.instantiateViewController(withIdentifier : "BankStatementViewController")
            bankStatementVC.modalPresentationStyle = .fullScreen
            
            self.show(bankStatementVC, sender: self)
      }
}
