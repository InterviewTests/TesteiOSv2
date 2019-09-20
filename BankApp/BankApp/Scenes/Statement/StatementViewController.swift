//
//  StatementViewController.swift
//  BankApp
//
//  Created by Marcus Titton on 19/09/19.
//  Copyright (c) 2019 Marcus Titton. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StatementDisplayLogic: class
{
  func displaySomething(viewModel: Statement.Something.ViewModel)
}

class StatementViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StatementDisplayLogic
{
    var interactor: StatementBusinessLogic?
    var router: (NSObjectProtocol & StatementRoutingLogic & StatementDataPassing)?
    
    
    @IBOutlet weak var txt_name: UILabel!
    @IBOutlet weak var txt_bank_agency: UILabel!
    @IBOutlet weak var txt_balance: UILabel!
    
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
    let interactor = StatementInteractor()
    let presenter = StatementPresenter()
    let router = StatementRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }

    // MARK: Routing
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let user = router?.dataStore?.user {
            txt_name.text = user.name
            txt_bank_agency.text = "\(user.bankAccount) / \(user.agency)"
            txt_balance.text = "R$ 0,00" //user.balance
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        if let user = router?.dataStore?.user {
//            txt_name.text = user.name
//            txt_bank.text = user.bankAccount
//            txt_agency.text = user.agency
//            txt_balance.text = "R$ 0,00" //user.balance
//        }
//        //fetchStatement()
//    }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
//  func doSomething()
//  {
//    let request = Statement.Something.Request()
//    interactor?.doSomething(request: request)
//  }
    
//    func displayHeader(viewModel: Login.RequestUser.ViewModel)
//    {
//        txt_name.text = viewModel.user.name
//        txt_bank.text = viewModel.user.bankAccount
//        txt_agency.text = viewModel.user.agency
//        txt_balance.text = "R$ 0,00"
//        //nameTextField.text = viewModel.name
//    }
  
    func displaySomething(viewModel: Statement.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        
        return celula
    }
}
