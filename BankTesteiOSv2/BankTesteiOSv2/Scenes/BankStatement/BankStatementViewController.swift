//
//  BankStatementViewController.swift
//  BankTesteiOSv2
//
//  Created by LeandroLee on 23/03/21.
//

import UIKit
import RxSwift
import RxCocoa

class BankStatementViewController: UIViewController
{
      var totalStatementTableViewCell : TotalStatementTableViewCell?
      
      let bankStatementViewModel = BankStatementViewModel()
      let disposeBag = DisposeBag()
      
      var bankStatementTableView: UITableView!
      {
            didSet
            {
                  bankStatementTableView.delegate = self
                  bankStatementTableView.dataSource = self
                  
                  bankStatementTableView.tableFooterView = UIView(frame: CGRect.zero)
                  bankStatementTableView.tag = 202
                  
                  view.addSubview(bankStatementTableView)
            }
      }
      
      override func viewDidLoad()
      {
            super.viewDidLoad()
            
            initViewDidLoad()
            registerCells()
            
            initCallBacks()
      }
      
      override func viewDidAppear(_ animated: Bool)
      {
            super.viewDidAppear(true)
            
            getStatementData()
      }
      
      override func viewWillLayoutSubviews()
      {
            super.viewWillLayoutSubviews()
            
            bankStatementTableView.frame = view.bounds
      }
      
      func initViewDidLoad()
      {
            self.navigationController?.isNavigationBarHidden = true
            
            bankStatementTableView = UITableView(frame: CGRect.zero, style: .grouped)
            bankStatementTableView.separatorStyle = .none
            bankStatementTableView.backgroundColor = uiColorApp
      }
      
      func registerCells()
      {
            self.bankStatementTableView.register(UINib(nibName: "TotalStatementTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.TotalStatementTableViewCell.rawValue)
            
            self.bankStatementTableView.register(UINib(nibName: "HeaderStatementTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.HeaderStatementTableViewCell.rawValue)
            self.bankStatementTableView.register(UINib(nibName: "StatementTableViewCell", bundle: nil), forCellReuseIdentifier: CellReuseIdentifier.StatementTableViewCell.rawValue)
      }
      
      func getStatementData()
      {
            guard let userId = userWSLogin?.userAccount.userId else { return }
            
            let userId2String = String(userId)

            bankStatementViewModel.getBankStatementData( userId2String )
      }
      
      func initCallBacks()
      {
            bankStatementViewModel.isLoading.asObservable()
                  .bind{ [self] isLoading in
                        if isLoading
                        {
                              displayLoadingV = AppDelegate.appDelegate.startLoadingOnActiveView(self.view)
                        }
                        else
                        {
                              AppDelegate.appDelegate.stopLoadingOnActiveView(displayLoadingV)
                        }
                  }.disposed(by: disposeBag)
            
            bankStatementViewModel.isSuccess.asObservable()
                  .bind{ isSuccess in
                        self.bankStatementTableView.reloadData()
                  }.disposed(by: disposeBag)
              
            bankStatementViewModel.errorMsg.asObservable()
                  .bind { errorMessage in
                        if !errorMessage.isEmpty
                        {
                              self.showErrorAlert(errorMessage)
                        }
                  }.disposed(by: disposeBag)
          }
      
      func logoutAndResetDataAction()
      {
            userEmailOrCPF = ""
            userPassword = ""
            
            userWSLogin = nil
            
            userWSStatementList = nil
            userWSStatementListCount = 0
      }
      
      func dismissVC()
      {
            navigationController?.popViewController(animated: true)
            
            dismiss(animated: true, completion: nil)
      }
}
