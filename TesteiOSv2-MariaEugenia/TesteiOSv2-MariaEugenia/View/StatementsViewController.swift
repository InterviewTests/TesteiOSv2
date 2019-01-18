//
//  StatementsViewController.swift
//  TesteiOSv2-MariaEugenia
//
//  Created by Maria Eugênia Teixeira on 13/01/19.
//  Copyright © 2019 Maria Eugênia Teixeira. All rights reserved.
//

import UIKit
import RxSwift

class StatementsViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var statementsList = [StatementList]()
    
    var viewModel = StatemensViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        viewModel.queryUserAccount()
        viewModel.fetchStatements()
        bindView()
    
    }
    
    @IBAction func logoutButtonAction(_ sender: Any) {
        viewModel.logoutUser()
    }
    
    func bindView() {
        
        viewModel.userAccount.asObservable()
            .bind { (userAccount) in
                self.nameLabel.text = userAccount?.name ?? ""
                self.accountLabel.text = "\(userAccount?.bankAccount ?? "-")" + "/" + "\(userAccount?.agency ?? "-")"
                self.balanceLabel.text = userAccount?.balance?.formatCurrency()
            }.disposed(by: disposeBag)
        
        viewModel.statementsViewModel.asObservable().bind { (_) in
            self.tableView.reloadData()
            }.disposed(by: disposeBag)
        
        viewModel.statementsViewModel
            .bind(to: tableView.rx.items(cellIdentifier: "CELL", cellType: StatementsTableViewCell.self)) { (row, element, cell) in
                cell.configureCell(statement: element)
            }
            .disposed(by: disposeBag)
    }
    
    func createCallBacks() {
        
        viewModel.isSuccess.asObservable()
            .bind{ value in
                if value { self.callLoginViewController() }
            }.disposed(by: disposeBag)
        
        viewModel.errorMsg.asObservable()
            .bind { errorMessage in
                if !errorMessage.isEmpty { self.presentMessage(errorMessage) }
            }.disposed(by: disposeBag)
        
    }
    
    func callLoginViewController() {
        let storyboard = UIStoryboard(storyboard: .main)
        let viewController: LoginViewController = storyboard.instantiateViewController()
        present(viewController, animated: true, completion: nil)
    }
    

}

