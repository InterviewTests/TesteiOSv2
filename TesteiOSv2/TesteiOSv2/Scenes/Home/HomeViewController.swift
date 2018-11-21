//
//  HomeViewController.swift
//  TesteiOSv2
//
//  Created by Felipe perius on 20/11/2018.
//  Copyright © 2018 Felipe Perius. All rights reserved.
//

import UIKit

protocol StatementOutput: class {
    func displayStatements(viewModel: HomeModel.Response)
    func displayUserViewModel(viewModel: HomeModel.UserViewModel)
}
class HomeViewController: UIViewController {
    // MARK: IBOutlet
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    private let dataSource = HomeDataScource()
    var interactor: StatementListBusinessLogic?
    var router:HomeRouter?
    
    // MARK: Object lifecycle
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
    
    // MARK: Setup
    private func setup()
    {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.router = router
        router.homeViewController = viewController
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor as? StatementListBusinessLogic
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTableView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.getUser()
        self.getStatements()
    }
    
    private func configTableView() {
        tableView.dataSource = dataSource as? UITableViewDataSource
        tableView.delegate = dataSource
        dataSource.tableView = tableView
        dataSource.registerNibs(in: tableView)
    }
    
    func getUser(){
        interactor?.loadUser()
    }
    
    func getStatements() {
        interactor?.fetchStatements(userId:"1")
    }
    
    
    @IBAction func logout(_ sender: Any) {
        self.router?.goToLogin()
    }
    
}

extension HomeViewController:StatementOutput{
    func displayUserViewModel(viewModel: HomeModel.UserViewModel) {
        userNameLabel.text = viewModel.name
        accountLabel.text = viewModel.account
        balanceLabel.text = viewModel.balance
    }
    
    func displayStatements(viewModel: HomeModel.Response) {
        if let statements = viewModel.statements {
            self.dataSource.statments = statements
        }
    }
}

