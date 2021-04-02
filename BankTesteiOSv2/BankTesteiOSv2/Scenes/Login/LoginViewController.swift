//
//  ViewController.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController
{
      var emailOrCPFTableViewCell : EmailOrCPFTableViewCell?
      var passwordTableViewCell : PasswordTableViewCell?
      
      var loginTableViewCell : LoginTableViewCell?
                              
      let loginViewModel = LoginViewModel()
                  
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
      
      var disposeBag = DisposeBag()
      
      override func viewDidLoad()
      {
            super.viewDidLoad()
            
            initViewDidLoad()
            registerCells()
            
            initCallBacks()
      }
      
      override func viewWillLayoutSubviews()
      {
            super.viewWillLayoutSubviews()
            
            loginTableView.frame = view.bounds
      }
      
      override func viewDidAppear(_ animated: Bool)
      {
            super.viewDidAppear(true)
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
      
      func resetViewWillDisappear()
      {
            self.loginTableView.reloadData()
      }
      
      func registerCells()
      {
            self.loginTableView.register(UINib(nibName: "LogoTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.LogoTableViewCell.rawValue)
            
            self.loginTableView.register(UINib(nibName: "EmailOrCPFTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.EmailOrCPFTableViewCell.rawValue)
            self.loginTableView.register(UINib(nibName: "PasswordTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.PasswordTableViewCell.rawValue)
            
            self.loginTableView.register(UINib(nibName: "LoginTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.LoginTableViewCell.rawValue)
      }
      
      func initCallBacks()
      {
            loginViewModel.isLoading.asObservable()
                  .bind{ [self] isLoading in
                        if isLoading
                        {
                              displayLoadingV = AppDelegate.appDelegate.startLoadingOnActiveView(self.view)
                        }
                        else
                        {
                              self.passwordTableViewCell?.passwordTxT.text = ""

                              AppDelegate.appDelegate.stopLoadingOnActiveView(displayLoadingV)
                        }
                  }.disposed(by: disposeBag)
            
            loginViewModel.isSuccess.asObservable()
                  .bind{ isSuccess in
                        if isSuccess
                        {
                              self.bankStatementAction()
                        }
                  }.disposed(by: disposeBag)
              
            loginViewModel.errorMsg.asObservable()
                  .bind { errorMessage in
                        if !errorMessage.isEmpty
                        {
                              self.showErrorAlert(errorMessage)
                        }
                  }.disposed(by: disposeBag)
          }
      
      func bankStatementAction()
      {
            let storyboard = UIStoryboard(name: "BankStatement", bundle: nil)
            let bankStatementVC = storyboard.instantiateViewController(withIdentifier : "BankStatementViewController")
            bankStatementVC.modalPresentationStyle = .fullScreen
            
            self.show(bankStatementVC, sender: self)
      }
}
