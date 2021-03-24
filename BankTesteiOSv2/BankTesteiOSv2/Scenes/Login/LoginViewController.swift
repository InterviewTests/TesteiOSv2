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
      
      fileprivate var loginTableView: UITableView!
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
            
            
            loginAction()
      }
      
      override func viewWillLayoutSubviews()
      {
            super.viewWillLayoutSubviews()
            
            loginTableView.frame = view.bounds
      }
      
      func initViewDidLoad()
      {
            loginTableView = UITableView(frame: CGRect.zero, style: .grouped)
            loginTableView.separatorStyle = .none
            loginTableView.backgroundColor = uiColorWhite
      }
      
      func registerCells()
      {
            self.loginTableView.register(UINib(nibName: "LogoTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.LogoTableViewCell.rawValue)
            
            self.loginTableView.register(UINib(nibName: "EmailOrCPFTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.EmailOrCPFTableViewCell.rawValue)
            self.loginTableView.register(UINib(nibName: "PasswordTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.PasswordTableViewCell.rawValue)
            
            self.loginTableView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.LoginTableViewCell.rawValue)
      }
      
      func loginAction()
      {
            let user = "test_user"
            let password = "Test@1"
            
            LoginProxy.loginAction(user, password) { (success, userLoginModel) in
                  if success
                  {
                        print("userLoginModel ---> \(userLoginModel?.userAccount.userId)")
                        guard let userId = userLoginModel?.userAccount.userId else { return }
                        
                        let userId2String = String(userId)
                        StatementProxy.getStatementAction(userId2String) { (success, userStatementList) in
                              print("userStatementList ---> \(userStatementList)")
                        }
                  }
            }
      }
      
      
      func bankStatementAction()
      {
            let storyboard = UIStoryboard(name: "BankStatement", bundle: nil)
            let bankStatementVC = storyboard.instantiateViewController(withIdentifier : "BankStatementViewController")
            bankStatementVC.modalPresentationStyle = .fullScreen
            
            self.show(bankStatementVC, sender: self)
      }
}

extension LoginViewController: UITableViewDataSource, UITableViewDelegate
{
      
      func numberOfSections(in tableView: UITableView) -> Int
      {
            return 3
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section
            {
            case 0:
                  return 1
                  
            case 1:
                  return 3
                  
            case 2:
                  return 1
                  
            default:
                  return 0
            }
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
      {
            let logoTableViewCell = loginTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.LogoTableViewCell.rawValue) as! LogoTableViewCell
            
            let emailOrCPFTableViewCell = loginTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.EmailOrCPFTableViewCell.rawValue) as! EmailOrCPFTableViewCell
            let passwordTableViewCell = loginTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.PasswordTableViewCell.rawValue) as! PasswordTableViewCell
            
            let loginTableViewCell = loginTableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier.LoginTableViewCell.rawValue) as! LoginTableViewCell
            
            switch (indexPath.section, indexPath.row)
            {
            case (0,0):
                  logoTableViewCell.selectionStyle = .none
                  logoTableViewCell.backgroundColor = UIColor.clear
                  
                  logoTableViewCell.LogoImGV.image = UIImage(named: "logo_icon")
                  
                  logoTableViewCell.LogoImGV.contentMode = UIView.ContentMode.scaleAspectFit
                  
                  return logoTableViewCell
                  
            case (1,1):
                  emailOrCPFTableViewCell.selectionStyle = .none
                  emailOrCPFTableViewCell.backgroundColor = UIColor.clear
                  
                  return emailOrCPFTableViewCell
                  
            case (1,2):
                  passwordTableViewCell.selectionStyle = .none
                  passwordTableViewCell.backgroundColor = UIColor.clear
                  
                  return passwordTableViewCell
                  
            case (2,0):
                  loginTableViewCell.selectionStyle = .none
                  loginTableViewCell.backgroundColor = UIColor.clear
                  
                  loginTableViewCell.delegate = self
                  
                  self.loginTableViewCell = loginTableViewCell
                  
                  return loginTableViewCell
                  
            default:
                  return UITableViewCell()
            }
      }
      
      func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
      {
            switch indexPath.section
            {
            case 0:
                  return 110.0
                  
            default:
                  return 66.0
            }
      }
      
}

extension LoginViewController: LoginTableViewCellDelegate
{
      func loginTableViewCellAction()
      {
            bankStatementAction()
      }
}

