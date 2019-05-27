//
//  StatementsViewController.swift
//  TesteiOSv2Acc
//
//  Created by Marlon Santos Heitor on 21/05/19.
//  Copyright (c) 2019 Marlon Santos Heitor. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementsDisplayLogic: class
{
    func displayStatements(viewModel: Statements.LoadStatements.ViewModel)
    func displayCustomerData(viewModel: Statements.LoadCustomerData.ViewModel)
    func displayLoggedOut(viewModel: Statements.Logout.ViewModel)
}

class StatementsViewController: UIViewController
{
    // MARK: - IBOutlets
    
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var bankAccountLabel: UILabel!
    @IBOutlet weak var bankAccountBalanceLabel: UILabel!
    @IBOutlet weak var statementsTableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    
    //MARK: - Local Instances
    
    var interactor: StatementsBusinessLogic?
    var router: (NSObjectProtocol & StatementsRoutingLogic & StatementsDataPassing)?
    
    var statementsData: [StatementData]?
    
    // MARK: - Object lifecycle
    
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
    
    private func setup()
    {
        let viewController = self
        let interactor = StatementsInteractor()
        let presenter = StatementsPresenter()
        let router = StatementsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setupTableView(){
        let nib = UINib(nibName: "StatementTableViewCell", bundle: nil)
        statementsTableView.register(nib, forCellReuseIdentifier: StatementTableViewCell.identifier)
        
        let headerNib = UINib(nibName: "StatementsTableViewHeaderTableViewCell", bundle: nil)
        statementsTableView.register(headerNib, forCellReuseIdentifier: StatementsTableViewHeaderTableViewCell.identifier)
        
        let refreshControl = UIRefreshControl()
        
        refreshControl.addTarget(self, action: #selector(loadStatements), for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            statementsTableView.refreshControl = refreshControl
        } else {
            statementsTableView.addSubview(refreshControl)
        }
        
        statementsTableView.dataSource = self
        statementsTableView.delegate = self
    }
    
    // MARK: - Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupTableView()
        loadCustomerData()
        loadStatements()
    }
    
    // MARK: - IBActions
    
    @IBAction func logoutAction(_ sender: Any) {
        logout()
    }
    
    // MARK: - Interactor methods
    
    private func loadCustomerData()
    {
        if let userAccount = router?.dataStore?.userAccount
        {
            let request = Statements.LoadCustomerData.Request(userAccount: userAccount)
            interactor?.loadCustomerData(request: request)
        }
    }
    
    @objc private func loadStatements()
    {
        if #available(iOS 10.0, *) {
            statementsTableView.refreshControl?.beginRefreshing()
        } else {
            showLoading()
        }
        
        guard let userId = router?.dataStore?.userAccount?.userId else {
            return
        }
        
        let request = Statements.LoadStatements.Request(userId: userId)
        interactor?.loadStatements(request: request)
    }
    
    private func logout()
    {
        AlertHelper.showYesNoAlert(context: self, title: "Atenção", message: "Deseja realmente sair?", yesAction: { (action) in
            let request = Statements.Logout.Request()
            self.interactor?.logout(request: request)
        }, noAction: nil)
    }
    
}

// MARK: - StatementsDisplayLogic implementation

extension StatementsViewController: StatementsDisplayLogic{
    
    func displayLoggedOut(viewModel: Statements.Logout.ViewModel) {
        dismiss(animated: true, completion: nil)
    }
    
    func displayCustomerData(viewModel: Statements.LoadCustomerData.ViewModel)
    {
        customerNameLabel.text = viewModel.fullname
        bankAccountLabel.text = viewModel.bankAgencyAccount
        bankAccountBalanceLabel.text = viewModel.balance
    }
    
    func displayStatements(viewModel: Statements.LoadStatements.ViewModel)
    {
        if #available(iOS 10.0, *) {
            statementsTableView.refreshControl?.endRefreshing()
        } else {
            hideLoading()
        }
        
        if let message = viewModel.serviceError?.message
        {
            let title = "Atenção"
            AlertHelper.showOkAlert(context: self, title: title, message: message)
        }else{
            statementsData = viewModel.statementsData
            statementsTableView.reloadData()
        }
    }
    
}

//MARK: - TableView Datasource and Delegate

extension StatementsViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let statementsData = statementsData else
        {
            return 0
        }
        return statementsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StatementTableViewCell.identifier) as? StatementTableViewCell
        else
        {
            return UITableViewCell()
        }
        
        if let statementsData = statementsData
        {
            let statementData = statementsData[indexPath.row]
            cell.load(data: statementData)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        guard let header = tableView.dequeueReusableCell(withIdentifier: StatementsTableViewHeaderTableViewCell.identifier) else
        {
            return UIView()
        }

        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
