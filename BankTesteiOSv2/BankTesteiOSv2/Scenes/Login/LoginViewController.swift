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
      
      var activityIndicatorV: UIActivityIndicatorView?
      
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
      }
      
      override func viewWillLayoutSubviews()
      {
            super.viewWillLayoutSubviews()
            
            loginTableView.frame = view.bounds
      }
      
      override func viewWillDisappear(_ animated: Bool)
      {
            super.viewWillDisappear(true)
            
            endViewWillDisappear()
      }
      
      func initViewDidLoad()
      {
            loginTableView = UITableView(frame: CGRect.zero, style: .grouped)
            loginTableView.separatorStyle = .none
            loginTableView.allowsSelection = false
            loginTableView.backgroundColor = uiColorWhite
      }
      
      func endViewWillDisappear()
      {
            passwordTableViewCell?.passwordTxT.text = ""
            passwordTableViewCell?.passwordTxT.placeholder = "   Senha    "
      }
      
      func registerCells()
      {
            self.loginTableView.register(UINib(nibName: "LogoTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.LogoTableViewCell.rawValue)
            
            self.loginTableView.register(UINib(nibName: "EmailOrCPFTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.EmailOrCPFTableViewCell.rawValue)
            self.loginTableView.register(UINib(nibName: "PasswordTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.PasswordTableViewCell.rawValue)
            
            self.loginTableView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.LoginTableViewCell.rawValue)
      }
      
      func verifyEmailOrCPFAndPasswordAction()
      {
            if !(emailOrCPFTableViewCell?.emailOrCPFTxTF.text?.isEmpty)!
            {
                  if !(passwordTableViewCell?.passwordTxT.text?.isEmpty)!
                  {
                        userEmailOrCPF = (emailOrCPFTableViewCell?.emailOrCPFTxTF.text!)!
                        userPassword = (passwordTableViewCell?.passwordTxT.text)!
                        
                        if userEmailOrCPF.contains("@")
                        {
                              checkEmail()
                        }
                        else if(userEmailOrCPF.count == 11)
                        {
                              checkCPF()
                        }
                        else
                        {
                              self.alert(message: "Por favor, verifique os campos \"E-mail ou CPF\", e tente novamente!", title: "Atenção")
                        }
                  }
                  else
                  {
                        self.alert(message: "Por favor, verifique os campos \"Senha\", e tente novamente!", title: "Atenção")
                  }
            }
            else
            {
                  self.alert(message: "Por favor, verifique os campos \"E-mail ou CPF e Senha\", e tente novamente!", title: "Atenção")
            }
      }
      
      func checkEmail()
      {
            if Regex.isRealEmail(userEmailOrCPF)
            {
                  if Regex.isAcceptablePassword(userPassword)
                  {
                        loginAction(userEmailOrCPF, userPassword)
                  }
                  else
                  {
                        self.alert(message: "Por favor, verifique os campos \"Senha\", e tente novamente!", title: "Atenção")
                  }
            }
            else
            {
                  self.alert(message: "Por favor, verifique os campos \"E-mail\", e tente novamente!", title: "Atenção")
            }
      }
      
      func checkCPF()
      {
            if userEmailOrCPF.isRealCPF
            {
                  if Regex.isAcceptablePassword(userPassword)
                  {
                        loginAction(userEmailOrCPF, userPassword)
                  }
                  else
                  {
                        self.alert(message: "Por favor, verifique os campos \"Senha\", e tente novamente!", title: "Atenção")
                  }
            }
            else
            {
                  self.alert(message: "Por favor, verifique os campos \"CPF\", e tente novamente!", title: "Atenção")
            }
      }
      
      func loginAction(_ user: String,_ password: String)
      {
            showActivityIndicatory()
            LoginProxy.loginAction(user, password) { (success, userLogin) in
                  if success
                  {
                        userWSLogin = userLogin
                        defaults.set(userEmailOrCPF, forKey: "userEmailOrCPF")
                        
                        guard let userId = userWSLogin?.userAccount.userId else { return }
                        
                        let userId2String = String(userId)
                        StatementProxy.getStatementAction(userId2String) { (success, userStatementList) in
                              userWSStatementList = userStatementList
                              userWSStatementListCount = (userWSStatementList?.statementList.count)!
                              
                              self.stopActivityIndicator()
                              
                              self.bankStatementAction()
                        }
                  }
            }
      }
      
      func showActivityIndicatory()
      {
            activityIndicatorV = UIActivityIndicatorView(style: .large)
            activityIndicatorV?.color = uiColorApp
            activityIndicatorV?.center = self.view.center
            
            self.view.addSubview(activityIndicatorV!)
            
            activityIndicatorV?.startAnimating()
      }
      
      func stopActivityIndicator()
      {
            if (activityIndicatorV != nil)
            {
                  activityIndicatorV?.stopAnimating()
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
                  
                  if (defaults.value(forKey: "userEmailOrCPF") != nil)
                  {
                        userEmailOrCPF = defaults.string(forKey: "userEmailOrCPF")!
                        emailOrCPFTableViewCell.emailOrCPFTxTF.text = userEmailOrCPF
                  }
                  else
                  {
                        emailOrCPFTableViewCell.emailOrCPFTxTF.placeholder =  "   E-mail ou CPF   "
                  }
                  
                  emailOrCPFTableViewCell.emailOrCPFTxTF.delegate = self
                  
                  self.emailOrCPFTableViewCell = emailOrCPFTableViewCell
                  
                  return emailOrCPFTableViewCell
                  
            case (1,2):
                  passwordTableViewCell.selectionStyle = .none
                  passwordTableViewCell.backgroundColor = UIColor.clear
                  
                  passwordTableViewCell.passwordTxT.placeholder = "   Senha    "
                  
                  passwordTableViewCell.passwordTxT.delegate = self
                  
                  self.passwordTableViewCell = passwordTableViewCell
                  
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
            verifyEmailOrCPFAndPasswordAction()
      }
}

extension LoginViewController: UITextFieldDelegate
{
      
      func textFieldShouldReturn(_ textField: UITextField) -> Bool
      {
            switch textField
            {
            case (emailOrCPFTableViewCell?.emailOrCPFTxTF)!:
                  passwordTableViewCell?.passwordTxT.becomeFirstResponder()
            default:
                  view.endEditing(true)
                  verifyEmailOrCPFAndPasswordAction()
            }
            return true
      }
      
}
