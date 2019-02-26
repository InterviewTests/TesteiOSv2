//
//  StatementsViewController.swift
//  TesteiOSv2
//
//  Created by Capgemini on 24/02/2019.
//  Copyright © 2019 Lucas. All rights reserved.
//

import UIKit

protocol StatementsDisplayLogic: class {
    func displayFetchedStatements(viewModel: ListStatements.FetchStatements.ViewModel)
}

class StatementsViewController: UITableViewController, StatementsDisplayLogic {
    
    func displayFetchedStatements(viewModel: ListStatements.FetchStatements.ViewModel) {
        
        headerUserView?.setUserData(user: viewModel.userDisplayed)
        
        self.listStatements = viewModel.statementsDisplayed
        self.tableView.reloadData()
    }
    
    var interactor: StatementsBusinessLogic?
    var router : (NSObjectProtocol & StatementsRoutingLogic & StatementsDataPassing)?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchStatements()
    }
    
    
    private func setup(){
        let viewController = self
        let interactor = StatementsInteractor()
        let presenter = StatementsPresenter()
        let router = StatementsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.worker = BankAPI()
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        headerUserView = LNSUserInfoView.instanceFromNib() as? LNSUserInfoView
        headerUserView?.delegate = self
    }
    
    private func fetchStatements(){
        if let user = router?.dataStore?.user {
            interactor?
                .listStatements(request:
                    ListStatements.FetchStatements.Request(user: user))
        }
    }
    var listStatements: [ListStatements.FetchStatements.ViewModel.StatementDisplayed] = []
    
    var headerUserView: LNSUserInfoView?
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listStatements.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayedStatement = listStatements[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "StatementTableViewCell") as? StatementTableViewCell
        if cell == nil {
            cell = StatementTableViewCell(style: .value1, reuseIdentifier: "StatementTableViewCell")
        }
        cell?.statement = displayedStatement
        return cell!
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return headerUserView
        }
        return UIView()
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250.0
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
extension StatementsViewController : UserInfoViewDelegate {
    func logoutTapped() {
        print("logout")
        router?.routeToLogout(segue: nil)
    }
}
