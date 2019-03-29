//
//  AccountViewController.swift
//  DesafioSantander
//
//  Created by Rodrigo Kieffer on 28/03/19.
//  Copyright © 2019 Rodrigo Kieffer. All rights reserved.
//

import UIKit

protocol AccountDisplayLogic: class {
    func showAlert(_ message: String)
    func showFetchedStatements(_ statements: [Statement])
}

class AccountViewController: UIViewController {
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var account: UserAccount?
    var interactor: AccountInteractor?
    var statements = [Statement]()
    
    // MARK: - View controller life cycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configurationView()
        loadStatements()
    }
    
    // MARK: - Privates
    
    private func setup() {
        let viewController = self
        let interactor = AccountInteractor()
        let presenter = AccountPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func configurationView() {
        accountNameLabel.text = account?.name
        accountNumberLabel.text = FormatterHelper.bankAccountFormatter(agency: account?.bankAccount ?? "0000", accountNumber: account?.agency ?? "000000000")
        balanceLabel.text = FormatterHelper.formatCurrency(value: NSNumber(value: account?.balance ?? 0.0))
    }
    
    func loadStatements() {
        interactor?.fetchStatements(userId: account?.userId ?? 0)
    }
    
    // MARK: - Actions
    
    @IBAction func logoutAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "loginViewController") as? LoginViewController
        
        DispatchQueue.main.async {
            let delegate = UIApplication.shared.delegate as! AppDelegate
            delegate.window?.rootViewController = controller
        }
    }
}

// MARK: - Extensions

extension AccountViewController: AccountDisplayLogic {
    func showAlert(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle:.alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showFetchedStatements(_ statements: [Statement]) {
        self.statements = statements
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatementCellIdentifier", for: indexPath) as! StatementTableViewCell
        
        let statement = statements[indexPath.row]
        cell.configureCell(statement: statement)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recentes"
    }
    
}
