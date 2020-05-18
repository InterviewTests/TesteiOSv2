//
//  AccountDetailsViewController.swift
//  challenge-santander
//
//  Created by Hugo Ferreira on 18/05/20.
//  Copyright (c) 2020 Hugo Ferreira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AccountDetailsDisplayLogic: class
{
    func displayInfoMessage(message: String)
    func displayAccountDetails(accountDetails: [AccountDetailsModel.AccountDetails])
}

class AccountDetailsViewController: UIViewController, AccountDetailsDisplayLogic
{
    @IBOutlet weak var labelClientName: UILabel!
    @IBOutlet weak var labelbankAccount: UILabel!
    @IBOutlet weak var labelBalance: UILabel!    
    @IBOutlet weak var containerView: UIView!
    
    var interactor: AccountDetailsBusinessLogic?
    var router: (NSObjectProtocol & AccountDetailsRoutingLogic & AccountDetailsDataPassing)?
    var accountDetails : [AccountDetailsModel.AccountDetails]?
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
        let interactor = AccountDetailsInteractor()
        let presenter = AccountDetailsPresenter()
        let router = AccountDetailsRouter()
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
//        tableView.dataSource = self
//        
//        tableView.register(UINib(nibName: "DetailsCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
//        containerView.backgroundColor = #colorLiteral(red: 0.99598068, green: 0.9961469769, blue: 0.9959587455, alpha: 1)
//        containerView.layer.masksToBounds = true
//        tableView.dataSource = self
//        tableView.register(UINib(nibName: "DetailsCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
//
//        setUserInfo()
    }
    
    func setUserInfo(){
        // self.tableView.reloadData()
//        labelClientName.text = userModel!.name
//        labelbankAccount.text = "\(userModel!.bankAccount!) /  \(userModel!.agency!)"
//        labelBalance.text = "R$ \(String(format: "%.2f", Float((userModel!.balance)!)))"
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Message
    
    func displayInfoMessage(message: String) {
        let alert = UIAlertController(title: "Login Inválido", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

// MARK: Extension

extension AccountDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountDetails?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! DetailsCell
        
        cell.titleLabel.text = accountDetails?[indexPath.row].title ?? ""
        cell.dateLabel.text = accountDetails?[indexPath.row].date ?? ""
        cell.descLabel.text = accountDetails?[indexPath.row].desc ?? ""
        cell.valueLabel.text = "R$ \(String(format: "%.2f", accountDetails?[indexPath.row].value ?? 0))"
        
        return cell
    }
    
    func displayAccountDetails(accountDetails: [AccountDetailsModel.AccountDetails]) {
        self.accountDetails = accountDetails
    }
    
}
