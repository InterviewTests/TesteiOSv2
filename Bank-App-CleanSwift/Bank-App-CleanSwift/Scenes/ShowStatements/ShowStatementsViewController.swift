//
//  ShowStatementsViewController.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import UIKit

protocol ShowStatementsLogic: class {
    func displayUserAccountInfo(viewModel: ShowStatements.ShowStatements.ViewModel)
}


class ShowStatementsViewController: UIViewController, ShowStatementsLogic {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userAccountLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
        
    var interactor: (ShowStatementsBusinessLogic & ShowStatementsDataStore)?
    var router: (NSObjectProtocol & ShowStatementsRoutingLogic & ShowStatementsDataPassing)?
    
    @IBAction func exitButtonPressed(_ button: UIButton) {
        print("Exiting...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideNavigationBar()
        
        let request = ShowStatements.ShowStatements.Request(userAccount: interactor?.userAccount)
        interactor?.showUserAccountData(request: request)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setupCleanSwiftObjects()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupCleanSwiftObjects()
    }
    
    private func setupCleanSwiftObjects() {
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
        
    
    func displayUserAccountInfo(viewModel: ShowStatements.ShowStatements.ViewModel) {        
        print("\(viewModel.fields.accountWithAgency), \(viewModel.fields.balance), \(viewModel.fields.name)")
    }
    
}


