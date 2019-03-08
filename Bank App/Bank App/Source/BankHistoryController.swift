//
//  BankHistoryController.swift
//  Bank App
//
//  Created by Chrystian (Pessoal) on 24/12/2018.
//  Copyright © 2018 Salgado's Productions. All rights reserved.
//

import Foundation
import UIKit

protocol BankHistoryDisplayLogic: class {
    
    func requestElements()
    func displayData(_ statementList: [Statement])
    func showError(_ alertController: UIAlertController)
    func setupStatusBar(statusBarStyle: UIStatusBarStyle, backgroudColor: UIColor?)
}

class BankHistoryController: UITableViewController, BankHistoryDisplayLogic {
    
    var interactor: BankHistoryBusinessLogic?
    var router: (NSObjectProtocol & BankHistoryRouterLogic & BankHistoryDataPassing)?
    
    var statementList: [Statement] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = BankHistoryInteractor()
        let presenter = BankHistoryPresenter()
        let router = BankHistoryRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.configureStatusBar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestElements()
    }
    
    func displayData(_ statementList: [Statement]) {
        self.statementList = statementList
        self.tableView.reloadData()
        
        guard let userAccount = router?.dataStore?.userAccount else { return }
        displayHeaderData(userAccount: userAccount)
    }
    
    func displayHeaderData(userAccount: UserAccountable) {
        guard let headerView = tableView.tableHeaderView as? BankHistoryHeaderView else { return }
        headerView.configure(userAccount)
    }
    
    func requestElements() {
        guard let userAccount = router?.dataStore?.userAccount else { return }
        interactor?.getStatementList(by: userAccount)
    }
    
    func showError(_ alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setupStatusBar(statusBarStyle: UIStatusBarStyle, backgroudColor: UIColor?) {
        self.setStatusBarStyle(statusBarStyle, backgroundColor: backgroudColor)
    }
    
    // MARK: Action
    
    @IBAction func actionLogOut(_ sender: Any) {
        performSegue(withIdentifier: "unwindToIntroController", sender: nil)
        interactor?.clearAutoLogin()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
       interactor?.configureStatusBarRelative(to: scrollView.contentOffset.y)
    }
}

extension BankHistoryController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return statementList.count > 0 ? 1 : 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statementList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as? BankHistoryTableViewCell
        cell?.display(statementList[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
