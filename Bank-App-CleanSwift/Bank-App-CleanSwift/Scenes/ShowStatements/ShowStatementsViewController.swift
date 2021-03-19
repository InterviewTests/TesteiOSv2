//
//  ShowStatementsViewController.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import UIKit

protocol ShowStatementsLogic: class {
    func displayUserAccountInfo(viewModel: ShowStatements.UserAccountDescription.ViewModel)
    func populateTableView(viewModel: ShowStatements.ShowStatements.ViewModel)
    func showErrorAlert(viewModel: ShowStatements.ShowStatements.ViewModel)
}

class ShowStatementsViewController: UIViewController, ShowStatementsLogic {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAccountLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
        
    var interactor: (ShowStatementsBusinessLogic & ShowStatementsDataStore)?
    var router: (NSObjectProtocol & ShowStatementsRoutingLogic & ShowStatementsDataPassing)?
    var statements: [Statement] = []
 
    // MARK: - Exit Button
    @IBAction func exitButtonPressed(_ button: UIButton) {
        router?.dismissScreen()
    }
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - View Will Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.hideNavigationBar()
        
        let userDescriptionRequest = ShowStatements.UserAccountDescription.Request(userAccount: interactor?.userAccount)
        interactor?.showUserAccountData(request: userDescriptionRequest)
            
        if let userId = interactor?.userAccount.userId {
            let showStatementsRequest = ShowStatements.ShowStatements.Request(userId: userId)
            interactor?.showStatements(request: showStatementsRequest)
        } 
    }
    
    // MARK: - Init with nibName
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setupCleanSwiftObjects()
    }
    
    
    // MARK: - Init With coder
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupCleanSwiftObjects()
    }
    
    
    // MARK: -
    func setupCleanSwiftObjects() {
        let viewController = self
        let interactor = ShowStatementsInteractor()
        let presenter = ShowStatementsPresenter()
        let router = ShowStatementsRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
        router.viewController = viewController
    }
        
    // MARK: -
    func displayUserAccountInfo(viewModel: ShowStatements.UserAccountDescription.ViewModel) {        
        self.userNameLabel.text = viewModel.fields.name
        self.userAccountLabel.text = viewModel.fields.accountWithAgency
        self.balanceLabel.text = viewModel.fields.balance
    }
    
    // MARK: -
    func populateTableView(viewModel: ShowStatements.ShowStatements.ViewModel) {
        if let statements = viewModel.statements {
            self.statements = statements
        }
        
        for st in statements {
            print("\(st.title) \(st.totalAmount)")
        }
    }
    
    func showErrorAlert(viewModel: ShowStatements.ShowStatements.ViewModel) {
        let errorMessage = viewModel.error!.message
        
        let alertController = UIAlertController(title: Constants.DEFAULT_ALERT_TITLE,
                                                message: errorMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: Constants.OK_ALERT_BUTTON_CAPTION, style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
}


