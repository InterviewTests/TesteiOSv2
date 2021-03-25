//
//  LoginExtension.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 25/03/21.
//

import UIKit

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
                                    
                  userEmailOrCPF = emailOrCPFTableViewCell?.emailOrCPFTxTF.text ?? ""
                  userPassword = passwordTableViewCell?.passwordTxT.text ?? ""
                  
                  loginViewModel.loginViewControllerDelegate = self
                  loginViewModel.verifyEmailOrCPFAndPasswordAction(userEmailOrCPF, userPassword)
            }
            return true
      }
      
}

extension LoginViewController: LoginTableViewCellDelegate
{
      func loginTableViewCellAction()
      {
            userEmailOrCPF = emailOrCPFTableViewCell?.emailOrCPFTxTF.text ?? ""
            userPassword = passwordTableViewCell?.passwordTxT.text ?? ""
            
            loginViewModel.loginViewControllerDelegate = self
            loginViewModel.verifyEmailOrCPFAndPasswordAction(userEmailOrCPF, userPassword)
      }
}

extension LoginViewController: LoginViewControllerDelegate
{
      
      func loginAction(_ user: String,_ password: String)
      {
            displayLoadingV = AppDelegate.appDelegate.startLoadingOnActiveView(self.view)

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
                              
                              AppDelegate.appDelegate.stopLoadingOnActiveView(displayLoadingV)
                              
                              self.bankStatementAction()
                        }
                  }
            }
      }
      
      func showErrorAlert(_ loginError: LoginError)
      {
            var loginErrorMessage = ""
            
            switch loginError
            {
            default:
                  loginErrorMessage = loginError.rawValue
            }
            
            self.alert(message: loginErrorMessage, title: "Atenção")
      }
      
}
