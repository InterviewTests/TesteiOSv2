//
//  ShowUserViewController.swift
//  TesteSantader
//
//  Created by Bruno Chen on 06/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import UIKit

protocol ShowUserDisplayLogic: class {
    func displayShowGreeting(viewModel: ShowUser.ShowGreeting.ViewModel)
    func displayStatement(viewModel: ShowUser.ShowStatementList.ViewModel)
    func getUser()
    func fetchStatement()
}

class ShowUserViewController: UIViewController, ShowUserDisplayLogic {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    
    @IBOutlet weak var tablewView: UITableView!
    
    @IBAction func logout(_ sender: UIButton) {
        interactor?.logoutUser()
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    var interactor: ShowUserBusinessLogic?
    var router: (NSObjectProtocol & ShowUserRoutingLogic & ShowUserDataPassing)?
    
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
    
    // MARK: - Setup
    
    func setup() {
        let viewController = self
        let interactor = ShowUserInteractor()
        let presenter = ShowUserPresenter()
        let router = ShowUserRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tablewView.dataSource = self
        fetchStatement()
        getUser()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    // MARK: - Fetch user
    
    func getUser() {
        let request = ShowUser.ShowGreeting.Request()
        interactor?.showGreeting(request: request)
    }
    
    func displayShowGreeting(viewModel: ShowUser.ShowGreeting.ViewModel) {
        nameLabel.text = viewModel.name
        accountLabel.text = "\(viewModel.account) / \(viewModel.bankAgency)"
        balanceLabel.text = viewModel.balance
    }
    
    // MARK: - Fetch statement list
    
    var displayedStatement: [ShowUser.ShowStatementList.ViewModel.DisplayedStatement] = []
    
    func fetchStatement() {
        let request = ShowUser.ShowStatementList.Request(userID: "")
        interactor?.getStatementList(request: request)
        
    }
    
    func displayStatement(viewModel: ShowUser.ShowStatementList.ViewModel) {
        displayedStatement = viewModel.displayedStatement
        tablewView.reloadData()
    }
    
}


// MARK: - Table view data source

extension ShowUserViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedStatement.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let displayedStatementOnly = displayedStatement[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatementListTableViewCell") as! ShowStatementTableViewCell
        cell.dateLabel.text = displayedStatementOnly.date
        cell.descLabel.text = displayedStatementOnly.desc
        cell.valueLabel.text = String(displayedStatementOnly.value)
        cell.titleLabel.text = displayedStatementOnly.title
        return cell
        
        
    }
    
    
    
    
    
}
