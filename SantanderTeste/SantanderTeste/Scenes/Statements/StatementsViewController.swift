//
//  StatementsViewController.swift
//  SantanderTeste
//
//  Created by Gerson Rodrigo on 18/03/19.
//  Copyright © 2019 Gerson Rodrigo. All rights reserved.
//

import UIKit



protocol StatementsDisplayLogic: class
{
    func displayFetchedStatements(viewModel: Statements.fetchStatements.ViewModel)
    func displayFetchLogin(viewModel: Statements.User.ViewModel)
    func displayError(error: String)
}

class StatementsViewController: UIViewController, StatementsDisplayLogic
{
   
    
    func displayError(error: String) {
        self.present(CallFeedBack().feedbackError(error: error), animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var account: UILabel!
    @IBOutlet weak var Balance: UILabel!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityLoading: UIActivityIndicatorView!
    
    
    var interactor: StatementsBusinessLogic?
    var router: (NSObjectProtocol & StatementsRoutingLogic & StatementsDataPassing)?
    var displayedStatments: [Statements.fetchStatements.ViewModel.DisplayViewModel] = []
    
 
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
    
   
    
    // MARK: View lifecycle
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUserDetails()
        setupViewLoading()
        configureTableView()
        registerNibFiles()
    }
    
    func setupUserDetails(){
        interactor?.UserData()
    }

    
    func setupDataDownloadedView(){
        activityLoading.stopAnimating()
        loadingView.isHidden = true
        activityLoading.isHidden = true
    }
    
    func setupViewLoading(){
        loadingView.isHidden = false
        activityLoading.isHidden = false
        activityLoading.startAnimating()
    }
    
    private func registerNibFiles(){
        let cell = UINib(nibName: "StatementCell", bundle: nil)
        tableview.register(
            cell,
            forCellReuseIdentifier: StatementViewModels.cellReuseIdentifier)
    }
    
    private func configureTableView() {
        tableview.rowHeight = 140
    }
  
    
    func displayFetchedStatements(viewModel: Statements.fetchStatements.ViewModel) {
        setupDataDownloadedView()
        displayedStatments = viewModel.displayStatements
        tableview.reloadData()
    }
    func displayFetchLogin(viewModel: Statements.User.ViewModel) {
        name.text = viewModel.displayLogin.name
        account.text = viewModel.displayLogin.bankAccount
        Balance.text = viewModel.displayLogin.balance
        print(viewModel.displayLogin.userId)
        fetchStatements(userID: viewModel.displayLogin.userId)
        
    }
    func fetchStatements(userID: String) {
        let request = Statements.fetchStatements.Request(id: userID)
        interactor?.fetchStatements(request: request)
    }
    
    
    @IBAction func logout(_ sender: Any) {
        
        router?.routeToLogin()
    }
    
}

extension StatementsViewController: UITableViewDataSource, UITableViewDelegate{
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
      return displayedStatments.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(
            withIdentifier: StatementViewModels.cellReuseIdentifier,
            for: indexPath) as! StatementTableViewCell
    
    
        let display = displayedStatments[indexPath.row]
        cell.viewModel = StatementViewModels.Statement.ViewModel(
            title: display.title,
            description: display.desc,
            date: display.date,
            value: display.value)

    
        return cell
   
    }
    
    
    
}
