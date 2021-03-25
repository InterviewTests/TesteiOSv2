//
//  LoginTableViewController.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 25/03/21.
//

import UIKit

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
                  
                  emailOrCPFTableViewCell.emailOrCPFTxTF.delegate = self
                  
                  self.emailOrCPFTableViewCell = emailOrCPFTableViewCell
                  
                  return emailOrCPFTableViewCell
                  
            case (1,2):
                  passwordTableViewCell.selectionStyle = .none
                  passwordTableViewCell.backgroundColor = UIColor.clear
                                    
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
