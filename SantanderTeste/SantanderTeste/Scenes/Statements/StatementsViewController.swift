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
}

class StatementsViewController: UIViewController, StatementsDisplayLogic
{
    
    
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
    
    var displayLogin: Login.fetchlogin.ViewModel.DisplayViewModel?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupViewLoading()
        setupUserInformations()
        configureTableView()
        registerNibFiles()
        fetchStatements()
    }
    
    func setupUserInformations(){
        name.text = displayLogin?.name
        account.text = displayLogin?.bankAccount
        Balance.text = displayLogin?.balance
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
        tableview.rowHeight = 110
    }
  
    func fetchStatements() {
        let request = Statements.fetchStatements.Request(id: (displayLogin?.userId)!)
        interactor?.fetchStatements(request: request)
    }
    
    func displayFetchedStatements(viewModel: Statements.fetchStatements.ViewModel) {
        setupDataDownloadedView()
        displayedStatments = viewModel.displayStatements
        tableview.reloadData()
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
